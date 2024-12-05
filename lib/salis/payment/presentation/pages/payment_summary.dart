import 'package:flutter/material.dart';
import 'package:salis/salis/core/widgets/app_button.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../props/data/property.dart';

class PaymentSummary extends StatelessWidget {
  final Property property;
  final double payment;

  const PaymentSummary(
      {required this.payment, required this.property, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.of(context).size.width * 0.95;

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]),
        child: AppButton(
          text: "Make Payment",
          onPress: () {},
        ),
      ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPropertyInfo(context, myWidth),
            const SizedBox(height: 20),
            _buildPaymentSummary(context, myWidth),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyInfo(BuildContext context, double myWidth) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                property.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                property.address,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),
              Text(
                'Total Cost: ₦${property.price}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              // Text(
              //   'Amount Paid: ₦${property.installmentPlan!.amountPaid!}',
              //   style: const TextStyle(fontSize: 16),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentSummary(BuildContext context, double myWidth) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Payment Summary',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Amount Paying: ₦${payment}',
                style: const TextStyle(fontSize: 14),
              ),
              // const SizedBox(height: 8),
              // Text(
              //   'Installment Plan: ₦${property.installmentPlan!.paymentAmounts[0]} / ${property.installmentPlan!.frequency.name}',
              //   style: const TextStyle(fontSize: 14),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
