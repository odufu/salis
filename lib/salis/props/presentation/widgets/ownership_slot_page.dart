import 'package:cicdtest/salis/core/utils/helper_functions.dart';
import 'package:cicdtest/salis/core/widgets/app_button.dart';
import 'package:cicdtest/salis/props/data/property.dart';
import 'package:cicdtest/salis/props/presentation/pages/prop_details.dart';
import 'package:cicdtest/salis/props/presentation/widgets/terms_and_agreement_page.dart';
import 'package:flutter/material.dart';

import 'fraction_paid_progress_bar.dart';

class OwnershipSlotsPage extends StatelessWidget {
  final Property property;
  const OwnershipSlotsPage({
    required this.property,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MARCH 2023"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            HelperFunctions.routeReplacdTo(
                PropDetails(
                  property: property,
                ),
                context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            "Ownership Slots",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const OwnershipSlotCard(
                  name: "Vincent Onoja",
                  amount: "₦200,000",
                  totalAmount: "5.6Mil",
                  percentage: "20%",
                  date: "13 March, 2023",
                  imageUrl: "assets/profile.png",
                  isPaid: true,
                ),
                const OwnershipSlotCard(
                  name: "Samuel Ameh",
                  amount: "₦200,000",
                  totalAmount: "5.6Mil",
                  percentage: "20%",
                  date: "13 March, 2023",
                  imageUrl: "assets/profile.png",
                  isPaid: true,
                ),
                const OwnershipSlotCard(
                  name: "Private ₦ame",
                  amount: "₦200,000",
                  totalAmount: "5.6Mil",
                  percentage: "50%",
                  date: "13 March, 2023",
                  imageUrl: "assets/profile.png",
                  isPaid: true,
                ),
                const OwnershipSlotCard(
                  name: "+234, 808 5040 146",
                  amount: "₦200,000",
                  totalAmount: "5.6Mil",
                  percentage: "10%",
                  date: "13 March, 2023",
                  isPaid: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "20,0000,000",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: Theme.of(context).colorScheme.error),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          "50%",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // Expanded(
                    //   child: Stack(
                    //     children: [
                    //       Positioned(
                    //           bottom: 23,
                    //           left: 10,
                    //           child: Container(
                    //             height: 1,
                    //             color: Theme.of(context).colorScheme.primary,
                    //           )),
                    //       FractionPaidProgressBar(
                    //         fractions: [
                    //           FractionPaidData(
                    //             isPaid: true,
                    //             imageUrl: 'assets/profile.png',
                    //             amountPaid: 200000,
                    //             equityOwned: 20.0,
                    //             datePaid: '13 March, 2023',
                    //           ),
                    //           FractionPaidData(
                    //             isPaid: false,
                    //             amountToPay: 300000,
                    //             equityToOwn: 30.0,
                    //           ),
                    //           FractionPaidData(
                    //             isPaid: true,
                    //             imageUrl: 'assets/profile.png',
                    //             amountPaid: 400000,
                    //             equityOwned: 40.0,
                    //             datePaid: '15 March, 2023',
                    //           ),
                    //           FractionPaidData(
                    //             isPaid: false,
                    //             amountToPay: 500000,
                    //             equityToOwn: 50.0,
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OwnershipSlotCard extends StatelessWidget {
  final String name;
  final String amount;
  final String totalAmount;
  final String percentage;
  final String date;
  final String? imageUrl;
  final bool isPaid;

  const OwnershipSlotCard({
    required this.name,
    required this.amount,
    required this.totalAmount,
    required this.percentage,
    required this.date,
    this.imageUrl,
    required this.isPaid,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: isPaid && imageUrl != null
                  ? AssetImage(imageUrl!)
                  : const AssetImage("assets/rounded logo.png"),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "$amount / $totalAmount",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            isPaid
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.tertiary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      percentage,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : AppButton(
                    text: "Buy",
                    width: 70,
                    onPress: () {
                      HelperFunctions.routePushTo(
                          TermsAndAgreementPage(onAccept: () {}), context);
                    }),
          ],
        ),
      ),
    );
  }
}
