import 'package:flutter/material.dart';
import 'package:salis/salis/core/utils/helper_functions.dart';
import 'package:salis/salis/core/widgets/app_button.dart';
import 'package:salis/salis/payment/presentation/pages/payment_summary.dart';
import 'package:salis/salis/props/data/property.dart';

import '../../../props/data/co_ownership.dart';
import '../../../props/presentation/widgets/pool_progress_bar.dart';

class CoOwnershipPaymentSummaryPage extends StatefulWidget {
  final Property property;

  const CoOwnershipPaymentSummaryPage({
    required this.property,
    Key? key,
  }) : super(key: key);

  @override
  State<CoOwnershipPaymentSummaryPage> createState() =>
      _CoOwnershipPaymentSummaryPageState();
}

class _CoOwnershipPaymentSummaryPageState
    extends State<CoOwnershipPaymentSummaryPage> {
  int selectedSlots = 0;
  double totalCost = 0.0;

  @override
  Widget build(BuildContext context) {
    int availableSlots = widget.property.coOwnershipPlan!
        .getAvailableShares()
        .length; // Count available slots

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Purchase Co-Ownership Slots"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Header
            Text(
              "Property: ${widget.property.title}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),

            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 1,
                      height: 120,
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
                            Text(
                              "Total Slots: ${widget.property.coOwnershipPlan!.ownershipShares.length} || ",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              "Available Slots: $availableSlots",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.green),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              color: Colors.green,
                              Icons.paid,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Total Worth: ₦${widget.property.price}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              color: Theme.of(context).colorScheme.primary,
                              Icons.payment,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Share Price: ₦${widget.property.coOwnershipPlan!.ownershipShares[0].sharePrice}/Shares",
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              color: Theme.of(context).colorScheme.primary,
                              Icons.hourglass_bottom,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .7,
                              child: PoolProgressBar(property: widget.property),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),

            // Slot Selection
            const Text(
              "Select Number of Slots",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: DropdownButton<int>(
                    isExpanded: true,
                    value: selectedSlots,
                    hint: const Text("Select Slots"),
                    items: List.generate(
                      availableSlots + 1,
                      (index) => DropdownMenuItem<int>(
                        value: index,
                        child: Text(index.toString()),
                      ),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedSlots = value;
                          totalCost = selectedSlots *
                              widget.property.coOwnershipPlan!.ownershipShares
                                  .first.sharePrice;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "₦${totalCost.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Purchase Button

            AppButton(
                width: 300,
                text:
                    "Purchase $selectedSlots ${selectedSlots == 1 ? 'Slot' : 'Slots'}",
                onPress: selectedSlots > 0 ? _purchaseSlots : null)
            // ElevatedButton(
            //   onPressed: selectedSlots > 0 ? _purchaseSlots : null,
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: const Size(double.infinity, 50),
            //     backgroundColor: Colors.green,
            //   ),
            //   child: Text(
            //     "Purchase $selectedSlots ${selectedSlots == 1 ? 'Slot' : 'Slots'}",
            //     style: const TextStyle(fontSize: 16),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _purchaseSlots() {
    // Logic to handle the purchase
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Purchase"),
        content: Text(
          "Are you sure you want to purchase $selectedSlots slot(s) for ₦${totalCost.toStringAsFixed(2)}?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _completePurchase(totalCost);
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  void _completePurchase(double totalCost) {
    // Implement actual purchase logic here (e.g., API call)

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            "Successfully purchased $selectedSlots slot(s) for ₦${totalCost.toStringAsFixed(2)}"),
      ),
    );

    HelperFunctions.routePushTo(
        PaymentSummary(payment: totalCost, property: widget.property), context);
  }
}
