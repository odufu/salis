import '../../../../salis/core/utils/helper_functions.dart';
import '../../../../salis/home/presentation/pages/home_page.dart';
import '../../../../salis/myprops/presentation/widgets/instalment_progress.dart';
import '../../../../salis/props/data/property.dart';
import 'package:flutter/material.dart';

class PayInstallmentDuePage extends StatelessWidget {
  final Property property;
  const PayInstallmentDuePage({required this.property, super.key});

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width * .97;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          property.title,
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                _buildCard(
                  title: property.title,
                  subtitle: property.address,
                  payment: '₦${property.installmentPlan!.paymentAmounts[0]}',
                  price: '₦${property.price}',
                  paymentsMade: property.installmentPlan!.amountPaid!,
                  context: context,
                  myWidth: myWidth,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildPaymentBreakdown(
                    totalPrice: property.price,
                    paymentMade: property.installmentPlan!.amountPaid!,
                    payment: '₦${property.installmentPlan!.paymentAmounts[0]}',
                    instalmentPlan:
                        '₦${property.installmentPlan!.paymentAmounts[0]}/${property.installmentPlan!.frequency.toString().split(".")[1]}',
                    context: context,
                    myWidth: myWidth),
              ],
            ),
            Row(
              children: [
                _buildImportantNotice(context, myWidth),
              ],
            ),
            const Spacer(),
            _buildActions(context, myWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required String price,
    required String payment,
    required double paymentsMade,
    required double myWidth,
    required BuildContext context,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: SizedBox(
        width: myWidth * 0.89,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.primary)),
                  Stack(clipBehavior: Clip.none, children: [
                    Container(
                      width: 100,
                      height: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Positioned(
                      left: 0,
                      bottom: -2,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: -2,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ]),
                  Text(payment,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Amount Paid",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.primary)),
                  Stack(clipBehavior: Clip.none, children: [
                    Container(
                      width: 100,
                      height: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Positioned(
                      left: 0,
                      bottom: -2,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: -2,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ]),
                  Text("₦${paymentsMade}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Cost",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.primary)),
                  Stack(clipBehavior: Clip.none, children: [
                    Container(
                      width: 100,
                      height: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Positioned(
                      left: 0,
                      bottom: -2,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: -2,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ]),
                  Text(price,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentBreakdown({
    required String payment,
    required String instalmentPlan,
    required double totalPrice,
    required double paymentMade,
    required BuildContext context,
    required double myWidth,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: SizedBox(
        width: myWidth * 0.89,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Payment Breakdown',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Payment to be made: $payment',
                  style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 4),
              Text('Installments Plan: $instalmentPlan',
                  style: const TextStyle(fontSize: 14)),
              SizedBox(
                height: 20,
              ),
              InstallmentProgress(paid: paymentMade, total: totalPrice)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImportantNotice(
    BuildContext context,
    double myWidth,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: SizedBox(
        width: myWidth * 0.89,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Important Notice',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary)),
              const SizedBox(height: 8),
              const Text(
                'Payments are non-refundable. Failure to complete payments may result in the cancellation of your co-ownership.',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context, double myWidth) {
    return SizedBox(
      width: myWidth,
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                HelperFunctions.routePushTo(
                    HomePage(
                      initialIndex: 2,
                    ),
                    context);
              },
              icon: Container(
                width: myWidth * .9,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_right),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Continue Purchase",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface),
                    )
                  ],
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Container(
                    width: myWidth * .4,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Call",
                        )
                      ],
                    ),
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Container(
                    width: myWidth * .4,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Call",
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
