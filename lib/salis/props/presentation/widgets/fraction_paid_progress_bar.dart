import 'package:flutter/material.dart';

class FractionPaidProgressBar extends StatelessWidget {
  final List<FractionPaidData> fractions;

  const FractionPaidProgressBar({
    required this.fractions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double availableWidth =
            (constraints.maxWidth - 70).clamp(0, double.infinity);
        int totalFractions = fractions.length;
        double circleDiameter = 24.0;
        double lineWidth = totalFractions > 1
            ? (availableWidth - (totalFractions * circleDiameter)) /
                (totalFractions - 1)
            : 0.0;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(fractions.length, (index) {
            final fraction = fractions[index];
            final isLast = index == fractions.length - 1;

            return Row(
              children: [
                Builder(
                  builder: (innerContext) => IconButton(
                    onPressed: () {
                      showDialog(
                        context: innerContext,
                        builder: (BuildContext context) {
                          return FractionPaidModal(fraction: fraction);
                        },
                      );
                    },
                    icon: Container(
                      width: circleDiameter,
                      height: circleDiameter,
                      decoration: BoxDecoration(
                        color: fraction.isPaid ? Colors.green : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: fraction.isPaid ? Colors.green : Colors.brown,
                          width: fraction.isPaid ? 3 : 1,
                        ),
                      ),
                      child: fraction.isPaid
                          ? const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                ),
                if (!isLast)
                  Container(
                    width: lineWidth,
                    height: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
              ],
            );
          }),
        );
      },
    );
  }
}

class FractionPaidData {
  final bool isPaid;
  final String imageUrl;
  final double amountPaid;
  final double equityOwned;
  final String datePaid;
  final double amountToPay;
  final double equityToOwn;

  FractionPaidData({
    required this.isPaid,
    this.imageUrl = '',
    this.amountPaid = 0.0,
    this.equityOwned = 0.0,
    this.datePaid = '',
    this.amountToPay = 0.0,
    this.equityToOwn = 0.0,
  });
}

class FractionPaidModal extends StatelessWidget {
  final FractionPaidData fraction;

  const FractionPaidModal({
    required this.fraction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(20),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: fraction.isPaid
              ? [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: fraction.imageUrl.isNotEmpty
                        ? AssetImage(fraction.imageUrl)
                        : const AssetImage('assets/default_image.png'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Amount Paid: \₦${fraction.amountPaid.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.bodyLarge ??
                        const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Equity Owned: ${fraction.equityOwned.toStringAsFixed(2)}%",
                    style: Theme.of(context).textTheme.bodyLarge ??
                        const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Date Paid: ${fraction.datePaid}",
                    style: Theme.of(context).textTheme.bodyMedium ??
                        const TextStyle(fontSize: 14),
                  ),
                ]
              : [
                  const Icon(
                    Icons.warning,
                    size: 50,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "No one has paid for this spot yet.",
                    style: Theme.of(context).textTheme.bodyLarge ??
                        const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Amount to Pay: \₦${fraction.amountToPay.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.bodyLarge ??
                        const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Equity to Own: ${fraction.equityToOwn.toStringAsFixed(2)}%",
                    style: Theme.of(context).textTheme.bodyLarge ??
                        const TextStyle(fontSize: 16),
                  ),
                ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Close"),
        ),
      ],
    );
  }
}
