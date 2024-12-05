import 'package:flutter/material.dart';

class InstallmentProgress extends StatelessWidget {
  final double total;
  final double paid;
  const InstallmentProgress({
    required this.paid,
    required this.total,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width * .35,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width * .35 * paid / total,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 8, 100, 11),
              borderRadius: BorderRadius.circular(50)),
        ),
      ],
    );
  }
}
