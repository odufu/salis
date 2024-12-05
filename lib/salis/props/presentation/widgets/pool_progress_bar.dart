import '../../../../salis/core/utils/helper_functions.dart';
import '../../../../salis/core/widgets/app_button.dart';
import '../../../../salis/myprops/presentation/widgets/buy_share_page.dart';
import '../../../../salis/props/data/co_ownership.dart';
import 'package:flutter/material.dart';

class PoolProgressBar extends StatelessWidget {
  final CoOwnershipPlan plan;

  const PoolProgressBar({
    required this.plan,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double availableWidth =
            (constraints.maxWidth - 80).clamp(0, double.infinity);
        int totalFractions = plan.ownershipShares.length;
        double circleDiameter = 24.0;
        double lineWidth = totalFractions > 1
            ? (availableWidth - (totalFractions * circleDiameter)) /
                (totalFractions - 1)
            : 0.0;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(plan.ownershipShares.length, (index) {
            final pool = plan.ownershipShares[index];
            final isLast = index == plan.ownershipShares.length - 1;

            return Row(
              children: [
                Builder(
                  builder: (innerContext) => IconButton(
                    onPressed: () {
                      showDialog(
                        context: innerContext,
                        builder: (BuildContext context) {
                          return PoolModal(pool: pool);
                        },
                      );
                    },
                    icon: Container(
                      width: circleDiameter,
                      height: circleDiameter,
                      decoration: BoxDecoration(
                        color: pool.isOccupied ? Colors.green : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: pool.isOccupied ? Colors.green : Colors.brown,
                          width: pool.isOccupied ? 3 : 1,
                        ),
                      ),
                      child: pool.isOccupied
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

class Pool {
  final bool isPaid;
  final String imageUrl;
  final double amountPaid;
  final double equityOwned;
  final String datePaid;
  final double amountToPay;
  final double equityToOwn;

  Pool({
    required this.isPaid,
    this.imageUrl = '',
    this.amountPaid = 0.0,
    this.equityOwned = 0.0,
    this.datePaid = '',
    this.amountToPay = 0.0,
    this.equityToOwn = 0.0,
  });
}

class PoolModal extends StatelessWidget {
  final OwnershipPool pool;

  const PoolModal({
    required this.pool,
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
          children: pool.isOccupied
              ? [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: pool.ownersImage!.isNotEmpty
                        ? AssetImage(pool.ownersImage!)
                        : const AssetImage('assets/profile.png'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Amount Paid: \₦${pool.sharePrice.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.bodyLarge ??
                        const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Equity Owned: ${pool.equityShare.toStringAsFixed(2)}%",
                    style: Theme.of(context).textTheme.bodyLarge ??
                        const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Date Paid: ${pool.dateCreated}",
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
                  Row(
                    children: [
                      const Icon(Icons.paid),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Share Price: \₦${pool.sharePrice.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.bodyLarge ??
                            const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.pie_chart),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Equity Size: ${pool.equityShare.toStringAsFixed(2)}%",
                        style: Theme.of(context).textTheme.bodyLarge ??
                            const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
        ),
      ),
      actions: [
        AppButton(
          text: "Buy",
          onPress: () {
            HelperFunctions.routePushTo(
                BuySharePage(
                  pool: pool,
                ),
                context);
          },
          backgroundColor: const Color.fromARGB(255, 37, 99, 39),
          width: 100,
        ),
        AppButton(
          text: "Close",
          onPress: () {
            Navigator.of(context).pop();
          },
          width: 100,
          backgroundColor: Colors.red,
        ),
      ],
    );
  }
}
