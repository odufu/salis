import 'dart:async';
import '../../../../salis/props/data/co_ownership.dart';
import '../../../../salis/props/data/property.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../../../../salis/core/utils/helper_functions.dart';
import '../../../../salis/core/widgets/app_button.dart';
import '../../../../salis/props/presentation/widgets/ownership_slot_page.dart';

import '../widgets/pool_progress_bar.dart';

class PropDetails extends StatefulWidget {
  final Property property;
  const PropDetails({
    required this.property,
    super.key,
  });

  @override
  State<PropDetails> createState() => _PropDetailsState();
}

class _PropDetailsState extends State<PropDetails> {
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Auto-slide every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      int nextPage =
          (_pageController.page!.toInt() + 1) % widget.property.images!.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(widget.property.title,
            style: TextStyle(color: Theme.of(context).colorScheme.surface)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Slider with Arrow Controls
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.property.images!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.property.images![index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 80,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 80,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),

            // Video Player Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Chewie(
                  controller: ChewieController(
                    videoPlayerController:
                        VideoPlayerController.asset(widget.property.video!),
                    autoPlay: false,
                    looping: false,
                    allowFullScreen: true,
                    materialProgressColors: ChewieProgressColors(
                      playedColor: Theme.of(context).colorScheme.primary,
                      handleColor: Colors.red,
                      backgroundColor: Colors.grey,
                    ),
                    placeholder: const Center(
                      child: Icon(Icons.play_circle_fill,
                          size: 60, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TITLE
                  Text(
                    widget.property.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //PROPS TYPE
                  Text(
                    "Landed",
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // LOCATION
                  Text(
                    widget.property.address,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  // DESCRIOTION
                  const Divider(),
                  Text(
                    widget.property.details,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  // CONTENTS
                  Text(
                    "Features",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          const Row(
                            children: [Icon(Icons.bolt), Text("Electricity")],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.apartment),
                              Text("Bedrooms: ${widget.property.bedrooms!}")
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Row(
                            children: [Icon(Icons.security), Text("Security")],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.bathroom),
                              Text("Bathroom: ${widget.property.bathrooms!}")
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Row(
                            children: [Icon(Icons.water), Text("Water")],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              Icon(Icons.width_full),
                              Text("Size: 1200 sq Foot")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  // EMENITIES
                  Text(
                    "Amenities",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 1,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.local_parking,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                  "Packing Space: ${widget.property.packingSpace ?? 0}")
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.landscape,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text("Garden: ${widget.property.garden ?? 0}")
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.pool,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text("Pool: ${widget.property.pool ?? 0}")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // // CO-OWN PULL DETAILS
                  // Text(
                  //   "My Share",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     color: Theme.of(context).colorScheme.primary,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: 1,
                  //       height: 40,
                  //       decoration: BoxDecoration(
                  //           color: Theme.of(context).colorScheme.primary),
                  //     ),
                  //     SizedBox(
                  //       width: 15,
                  //     ),
                  //     const Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Icon(
                  //               Icons.show_chart,
                  //               size: 15,
                  //             ),
                  //             SizedBox(
                  //               width: 5,
                  //             ),
                  //             Text("Co-Ownership Details: 15%")
                  //           ],
                  //         ),
                  //         Row(
                  //           children: [
                  //             Icon(
                  //               Icons.donut_large,
                  //               size: 15,
                  //             ),
                  //             SizedBox(
                  //               width: 5,
                  //             ),
                  //             Text("Total Ownership Pregress: 90%")
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // //PRICE AND PAYMENTS
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // Text(
                  //   "Price and Payment Details",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     color: Theme.of(context).colorScheme.primary,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: 1,
                  //       height: 40,
                  //       decoration: BoxDecoration(
                  //           color: Theme.of(context).colorScheme.primary),
                  //     ),
                  //     SizedBox(
                  //       width: 15,
                  //     ),
                  //     const Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Icon(
                  //               Icons.payment,
                  //               size: 15,
                  //             ),
                  //             SizedBox(
                  //               width: 5,
                  //             ),
                  //             Text("Total Property Cost: ₦ 500, 0000")
                  //           ],
                  //         ),
                  //         Row(
                  //           children: [
                  //             Icon(
                  //               Icons.calendar_today,
                  //               size: 15,
                  //             ),
                  //             SizedBox(
                  //               width: 5,
                  //             ),
                  //             Text("Payment Schedule: 6 x ₦ 10 Mil")
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // POOL SHARES
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PAYMENT POOL (Muli-Owners)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 1,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      Icons.countertops,
                                      size: 15,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text("Price/Pool: 10000000"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      Icons.circle,
                                      size: 15,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text("Opened Pools: 5")
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: PoolProgressBar(
                              plan: CoOwnershipPlan(
                                  propertyId: "Prop002",
                                  totalValue: 200000000,
                                  numberOfShares: 4,
                                  sharePrice: 300000),
                            )),
                      ],
                    ),
                  ),

                  //AVAILABILITY
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "AVAILABILITY",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 1,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    Icons.done_all,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text("Status: In Progress")
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    Icons.hourglass_bottom,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text("Next Payment Due: 24th Dec. 2024")
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //AVAILABILITY
                  Text(
                    "WHY SHOULD YOU BUY THIS?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 1,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.verified,
                                size: 15,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Good title Document (Registered Survey)")
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.approval,
                                color: Colors.red,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Free from Government")
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.show_chart,
                                color: Colors.red,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Fast appreciable value")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // SITE MAP
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "SITE MAP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset("assets/images/map.jpg"),
                  // FLOOR PLANS
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "HOUSE PLAN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset("assets/images/plan.jpg"),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            AppButton(
                text: "Get 10%",
                width: MediaQuery.of(context).size.width * .4,
                onPress: () {
                  HelperFunctions.routePushTo(
                      OwnershipSlotsPage(
                        property: widget.property,
                      ),
                      context);
                }),
            AppButton(
              text: "Puechase",
              width: MediaQuery.of(context).size.width * .4,
              onPress: () {},
              backgroundColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
