import 'dart:async';
import 'package:salis/salis/payment/presentation/pages/co_ownership_payment_summary_page.dart';
import 'package:salis/salis/payment/presentation/pages/instalment_plan_selection_page.dart';

import '../../../../salis/core/utils/helper_functions.dart';
import '../../../../salis/core/widgets/app_button.dart';
import '../../../../salis/myprops/presentation/widgets/buy_share_page.dart';
import '../../../../salis/myprops/presentation/widgets/my_props_details.dart';
import '../../../payment/presentation/pages/payment_summary.dart';
import '../../../../salis/props/data/property.dart';
import 'package:flutter/material.dart';

import '../../../props/data/co_ownership.dart';
import '../../../props/presentation/widgets/pool_progress_bar.dart';
import 'instalment_progress.dart';

class MyPropsCard extends StatefulWidget {
  final Property property;

  const MyPropsCard({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  _MyPropsCardState createState() => _MyPropsCardState();
}

class _MyPropsCardState extends State<MyPropsCard> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.property.images!.length;
      });
    });
  }

  void _stopAutoSlide() {
    _timer.cancel();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onNext() {
    _stopAutoSlide();
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.property.images!.length;
    });
    _startAutoSlide();
  }

  void _onPrevious() {
    _stopAutoSlide();
    setState(() {
      _currentIndex = (_currentIndex - 1 + widget.property.images!.length) %
          widget.property.images!.length;
    });
    _startAutoSlide();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Carousel Section
          Stack(
            children: [
              // Image Display
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  widget.property.images![_currentIndex],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Left Arrow Button
              Positioned(
                left: 8,
                top: 75,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: _onPrevious,
                ),
              ),

              // Right Arrow Button
              Positioned(
                right: 8,
                top: 75,
                child: IconButton(
                  icon:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: _onNext,
                ),
              ),
            ],
          ),

          // Dots Indicator
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.property.images!.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    _stopAutoSlide();
                    setState(() {
                      _currentIndex = entry.key;
                    });
                    _startAutoSlide();
                  },
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          //INSTALMENT DETAILS

          widget.property.installmentPlan != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.property.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.loop, size: 18, color: Colors.grey[700]),
                          const SizedBox(width: 8),
                          Text(
                              ' Instalment: ${widget.property.installmentPlan!.paymentSchedules[0].toString().split(" ")[0]}')
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.paid, size: 18, color: Colors.green),
                          const SizedBox(width: 8),
                          Text(
                              'Total Worth: ₦ ${widget.property.price.round()}'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.check_circle,
                              size: 18, color: Colors.green),
                          const SizedBox(width: 8),
                          Text(
                              'Amount Paid: ₦ ${widget.property.installmentPlan!.amountPaid!.round()}'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.date_range,
                              size: 18, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text(
                              'Schedule: ${widget.property.installmentPlan!.paymentAmounts[0]}/${widget.property.installmentPlan!.frequency.toString().split(".")[1]}'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InstallmentProgress(
                                total:
                                    widget.property.installmentPlan!.totalCost,
                                paid: widget
                                    .property.installmentPlan!.amountPaid!,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  size: 18, color: Colors.red),
                              const SizedBox(width: 4),
                              Container(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Text(
                                  widget.property.address,
                                  softWrap: true,
                                  style: const TextStyle(fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              :

              //CO-OWNERSHIP DETAILS

              widget.property.coOwnershipPlan != null
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.property.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: Text(
                                    widget.property.details,
                                    maxLines: 2,
                                  ))
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.paid,
                                  size: 18, color: Colors.green),
                              const SizedBox(width: 8),
                              Text(
                                  'Total Worth: ₦ ${widget.property.price.round()}'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.paid,
                                  size: 18, color: Colors.green),
                              const SizedBox(width: 8),
                              Text(
                                  '₦${(widget.property.coOwnershipPlan!.ownershipShares[0].sharePrice)}/Share @ ${(widget.property.coOwnershipPlan!.ownershipShares[0].equityShare)}% Ownership'),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * .8,
                                  height: 40,
                                  child: PoolProgressBar(
                                    property: widget.property,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                  :
                  //OUTRIGHT PAYMENT
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.property.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: Text(
                                    widget.property.details,
                                    maxLines: 2,
                                  ))
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.paid,
                                  size: 18, color: Colors.green),
                              const SizedBox(width: 8),
                              Text(
                                  'Total Worth: ₦ ${widget.property.price.round()}'),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < widget.property.rating!.toInt()
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.orange,
                                    size: 20,
                                  );
                                }),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.location_on,
                                      size: 18, color: Colors.red),
                                  const SizedBox(width: 4),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    child: Text(
                                      widget.property.address,
                                      softWrap: true,
                                      style: const TextStyle(fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              widget.property.installmentPlan != null
                  ? AppButton(
                      text: "Pay Due",
                      onPress: () {
                        HelperFunctions.routePushTo(
                            InstalmentPlanSelectionPage(
                              title: widget.property.title,
                              details: widget.property.details,
                              price: widget.property.price,
                              closingPeriod: widget
                                  .property.installmentPlan!.closingPeriod,
                              minInitialPayment: widget.property
                                  .installmentPlan!.minimumInitialPayment,
                              property: widget.property,
                            ),
                            context);
                      },
                    )
                  : widget.property.coOwnershipPlan != null
                      ? AppButton(
                          text: "Buy Share",
                          onPress: () {
                            HelperFunctions.routePushTo(
                                CoOwnershipPaymentSummaryPage(
                                    property: widget.property),
                                context);
                          },
                        )
                      : SizedBox.shrink(),
              AppButton(
                text: "View",
                onPress: () {
                  HelperFunctions.routePushTo(
                      MyPropsDetails(property: widget.property), context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
