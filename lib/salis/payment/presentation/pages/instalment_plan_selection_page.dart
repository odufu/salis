import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salis/salis/core/utils/helper_functions.dart';
import 'package:salis/salis/core/widgets/app_button.dart';
import 'package:salis/salis/payment/presentation/pages/payment_summary.dart';
import 'package:salis/salis/props/data/property.dart';

class InstalmentPlanSelectionPage extends StatefulWidget {
  final String title;
  final String details;
  final double price;
  final Property property;
  final int closingPeriod;
  final double minInitialPayment; // Minimum initial payment

  const InstalmentPlanSelectionPage({
    required this.title,
    required this.details,
    required this.price,
    required this.closingPeriod,
    required this.property,
    required this.minInitialPayment,
    Key? key,
  }) : super(key: key);

  @override
  State<InstalmentPlanSelectionPage> createState() =>
      _InstalmentPlanSelectionPageState();
}

class _InstalmentPlanSelectionPageState
    extends State<InstalmentPlanSelectionPage> {
  final TextEditingController initialPaymentTextController =
      TextEditingController();
  String frequency = "Monthly";
  List<Map<String, String>> instalmentPlan = [];
  bool canProceedToPayment = false; // Tracks if the user can proceed to payment

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instalment Plan"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Details Card
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.details,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Cost",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        Text("₦${widget.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Closing Period",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        Text("${widget.closingPeriod} years",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Min Initial Payment",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        Text("₦${widget.minInitialPayment.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown for Frequency Selection
            DropdownButtonFormField<String>(
              value: frequency,
              items: ["Daily", "Weekly", "Monthly", "Quarterly", "Yearly"]
                  .map((freq) =>
                      DropdownMenuItem(value: freq, child: Text(freq)))
                  .toList(),
              decoration: InputDecoration(
                labelText: "Payment Frequency",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (value) {
                setState(() {
                  frequency = value ?? "Monthly";
                  calculateInstalmentPlan();
                });
              },
            ),
            const SizedBox(height: 20),

            // Input for Initial Payment
            TextField(
              controller: initialPaymentTextController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Initial Payment (₦)",
                hintText: "Enter at least ₦${widget.minInitialPayment}",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (_) => calculateInstalmentPlan(),
            ),
            const SizedBox(height: 20),

            // Instalment Plan Preview
            instalmentPlan.isNotEmpty
                ? Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Instalment Plan",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Divider(height: 20),
                          ...instalmentPlan.map((plan) {
                            return ListTile(
                              leading: Icon(Icons.date_range,
                                  color: Theme.of(context).colorScheme.primary),
                              title: Text(plan["date"] ?? ""),
                              trailing: Text(plan["amount"] ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  )
                : const Text("Enter details to see your instalment plan"),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            boxShadow: [BoxShadow(blurRadius: 10)]),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: AppButton(
            text: "Continue Payment",
            onPress: () {
              HelperFunctions.routePushTo(
                  PaymentSummary(
                    property: widget.property,
                    payment: double.parse(initialPaymentTextController.text),
                  ),
                  context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Redirecting to Paystack..."),
                backgroundColor: Colors.green,
              ));
            }),
      ),
    );
  }

  void calculateInstalmentPlan() {
    setState(() {
      instalmentPlan.clear();
      canProceedToPayment = false;
    });

    final totalCost = widget.price;
    final closingPeriodYears = widget.closingPeriod;
    final initialPayment =
        double.tryParse(initialPaymentTextController.text) ?? 0;

    if (initialPayment < widget.minInitialPayment ||
        initialPayment >= totalCost) {
      return; // Do nothing if the initial payment is invalid
    }

    final remainingBalance = totalCost - initialPayment;
    int paymentsPerYear;

    switch (frequency.toLowerCase()) {
      case "daily":
        paymentsPerYear = 365;
        break;
      case "weekly":
        paymentsPerYear = 52;
        break;
      case "monthly":
        paymentsPerYear = 12;
        break;
      case "quarterly":
        paymentsPerYear = 4;
        break;
      case "yearly":
        paymentsPerYear = 1;
        break;
      default:
        paymentsPerYear = 12;
    }

    final maxPayments = paymentsPerYear * closingPeriodYears;
    final paymentAmount = remainingBalance / maxPayments;
    DateTime paymentDate = DateTime.now();

    for (int i = 0; i < maxPayments; i++) {
      instalmentPlan.add({
        "date": DateFormat.yMMMd().format(paymentDate),
        "amount": "₦${paymentAmount.toStringAsFixed(2)}",
      });

      switch (frequency.toLowerCase()) {
        case "daily":
          paymentDate = paymentDate.add(const Duration(days: 1));
          break;
        case "weekly":
          paymentDate = paymentDate.add(const Duration(days: 7));
          break;
        case "monthly":
          paymentDate = DateTime(
              paymentDate.year, paymentDate.month + 1, paymentDate.day);
          break;
        case "quarterly":
          paymentDate = DateTime(
              paymentDate.year, paymentDate.month + 3, paymentDate.day);
          break;
        case "yearly":
          paymentDate = DateTime(
              paymentDate.year + 1, paymentDate.month, paymentDate.day);
          break;
      }
    }

    // Enable payment button if criteria are met
    setState(() {
      canProceedToPayment = true;
    });
  }
}
