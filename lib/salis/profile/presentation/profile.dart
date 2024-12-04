import 'package:cicdtest/salis/profile/presentation/widgets/dp_card.dart';
// import 'package:cicdtest/salis/props/presentation/property.dart';
import 'package:flutter/material.dart';

import '../../props/data/property.dart';
import 'widgets/my_product_card.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DpCard(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyProductCard(
                  property: myProperties[0],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyProductCard(
                  property: myProperties[1],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
