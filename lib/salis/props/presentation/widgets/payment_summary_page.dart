import 'package:cicdtest/salis/core/utils/helper_functions.dart';
import 'package:cicdtest/salis/core/widgets/app_button.dart';
import 'package:cicdtest/salis/home/presentation/pages/home_page.dart';
import 'package:cicdtest/salis/myprops/presentation/my_props.dart';
import 'package:flutter/material.dart';

class PaymentSummaryPage extends StatelessWidget {
  const PaymentSummaryPage({super.key});

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
          'Payment Summary',
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
                    title: 'Luxe City Apartments',
                    subtitle: '123 Main Street, Urbanville',
                    price: '₦4.5 Mil',
                    ownership: 'Selected Ownership\n10% Own',
                    totalCost: 'Total Cost\n₦75 Mil',
                    context: context,
                    myWidth: myWidth),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildPaymentBreakdown(
                    initialPayment: '₦15 Mil',
                    monthlyInstallments: '5 x ₦12 Mil',
                    context: context,
                    myWidth: myWidth),
              ],
            ),
            const SizedBox(height: 16),
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

  Widget _buildCard(
      {required String title,
      required String subtitle,
      required String price,
      required String ownership,
      required double myWidth,
      required BuildContext context,
      required String totalCost}) {
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
                  Text(price,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(ownership,
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700])),
                      Text(totalCost,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentBreakdown({
    required String initialPayment,
    required String monthlyInstallments,
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
              Text('Initial Payment: $initialPayment',
                  style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 4),
              Text('Monthly Installments: $monthlyInstallments',
                  style: const TextStyle(fontSize: 14)),
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
