import 'dart:async';
import 'package:salis/salis/props/data/co_ownership.dart';
import 'package:salis/salis/props/presentation/widgets/pool_progress_bar.dart';

import '../../../../salis/core/utils/helper_functions.dart';
import '../../../../salis/props/data/property.dart';
import '../../../../salis/props/presentation/pages/prop_details.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/app_button.dart';

class ProductCard extends StatefulWidget {
  final Property property;

  const ProductCard({
    required this.property,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final PageController _pageController = PageController();
  Timer? _autoSlideTimer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_pageController.page?.toInt() ?? 0) + 1;
        _pageController.animateToPage(
          nextPage %
              widget.property.images!.length, // Wrap around to the first image
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  PageView.builder(
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
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_left, size: 30),
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_right, size: 30),
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.property.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.property.details,
            ),
            const SizedBox(height: 10),

            // P A Y M E N T   P L A N S
            //INSTALMENTAL PAYMENT
            widget.property.installmentPlan != null
                ? Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.paid),
                          Text(
                            "INSTALMENT",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.donut_large),
                          Text(
                            "INST.||",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Icon(
                            Icons.attach_money_rounded,
                            color: Colors.green,
                          ),
                          Text(
                            " ₦${widget.property.price.round().toString()}/",
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                          const Icon(
                            Icons.money_off_sharp,
                            color: Colors.red,
                          ),
                          Text(
                            " ₦${widget.property.installmentPlan!.paymentAmounts[0].truncateToDouble()}",
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ],
                  )
                :

                //  CO-OWNERSHIP PAYMENT
                widget.property.coOwnershipPlan != null
                    ? Column(
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.paid),
                              Text(
                                "Co-Ownership Plan",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.add_chart_sharp),
                              const Icon(
                                Icons.attach_money_rounded,
                                color: Colors.green,
                              ),
                              Text(
                                " ₦${widget.property.price.round().toString()}/",
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal),
                              ),
                              const Icon(
                                Icons.money_off_sharp,
                                color: Colors.red,
                              ),
                              Text(
                                "₦${widget.property.coOwnershipPlan!.getAvailableShares()[0].sharePrice.toString()}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: .5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .8,
                                child:
                                    PoolProgressBar(property: widget.property),
                              )
                            ],
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.paid),
                              Text(
                                "Outright Payment",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.add_chart_sharp),
                              const Icon(
                                Icons.attach_money_rounded,
                                color: Colors.green,
                              ),
                              Text(
                                " ₦${widget.property.price.round().toString()}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ],
                      ),
            const SizedBox(height: 10),
            Divider(
              thickness: .5,
            ),
            Row(
              children: [
                AppButton(
                  text: "VIEW Details",
                  width: 130,
                  onPress: () {
                    HelperFunctions.routePushTo(
                        PropDetails(
                          property: widget.property,
                        ),
                        context);
                  },
                  backgroundColor: const Color.fromARGB(255, 29, 97, 31),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Theme.of(context).colorScheme.surface,
                      size: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
