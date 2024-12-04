import 'dart:async';
import 'package:cicdtest/salis/core/utils/helper_functions.dart';
import 'package:cicdtest/salis/props/data/property.dart';
import 'package:cicdtest/salis/props/presentation/pages/prop_details.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/app_button.dart';
import 'fraction_paid_progress_bar.dart';

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
            const Text(
              "Chic one-bedroom apartment featuring contemporary design, ample natural light, and prime city accessibility",
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "₦${widget.property.price.round().toString()} ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Theme.of(context).colorScheme.error),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Text(
                      "50%",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // const SizedBox(width: 10),
                // FractionPaidProgressBar(
                //   fractions: [
                //     FractionPaidData(
                //       isPaid: true,
                //       imageUrl: 'assets/profile.png',
                //       amountPaid: 200000,
                //       equityOwned: 20.0,
                //       datePaid: '13 March, 2023',
                //     ),
                //     FractionPaidData(
                //       isPaid: false,
                //       amountToPay: 300000,
                //       equityToOwn: 30.0,
                //     ),
                //     FractionPaidData(
                //       isPaid: true,
                //       imageUrl: 'assets/profile.png',
                //       amountPaid: 400000,
                //       equityOwned: 40.0,
                //       datePaid: '15 March, 2023',
                //     ),
                //     FractionPaidData(
                //       isPaid: false,
                //       amountToPay: 500000,
                //       equityToOwn: 50.0,
                //     ),
                //   ],
                // ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
