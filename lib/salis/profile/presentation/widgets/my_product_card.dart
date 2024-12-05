import '../../../../salis/core/utils/helper_functions.dart';
import '../../../../salis/myprops/presentation/widgets/my_props_details.dart';
import '../../../../salis/props/data/property.dart';
import 'package:flutter/material.dart';

class MyProductCard extends StatefulWidget {
  final Property property;
  const MyProductCard({
    required this.property,
    super.key,
  });

  @override
  State<MyProductCard> createState() => _MyProductCardState();
}

class _MyProductCardState extends State<MyProductCard> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        HelperFunctions.routePushTo(
            MyPropsDetails(
              property: widget.property,
            ),
            context);
      },
      icon: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(widget.property.images![0]),
                        )),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 1,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //P A Y M E N T  D E T A I L S

                      //INSTALLMENTATAL PAYMENT
                      widget.property.installmentPlan == null
                          ? CircularProgressIndicator()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.apartment,
                                      size: 15,
                                      weight: 4,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      widget.property.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.donut_large,
                                      size: 15,
                                      weight: 4,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Total Worth: ${widget.property.installmentPlan!.totalCost}%",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.show_chart,
                                      size: 15,
                                      weight: 4,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Payment: ${(widget.property.price - widget.property.installmentPlan!.initialPayment.toDouble()).round()}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
