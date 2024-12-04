import 'package:cicdtest/salis/props/data/property.dart';
import 'package:flutter/material.dart';
import 'widgets/my_props_card.dart';

class MyProps extends StatefulWidget {
  const MyProps({super.key});

  @override
  State<MyProps> createState() => _MyPropsState();
}

class _MyPropsState extends State<MyProps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 450, // Maximum width for each card
            mainAxisExtent: 470,
            mainAxisSpacing: 16.0, // Vertical spacing between cards
            crossAxisSpacing: 16.0, // Horizontal spacing between cards
            childAspectRatio: .9, // Adjust card aspect ratio (width/height)
          ),
          itemCount: 5, // Replace with your actual number of items
          itemBuilder: (context, index) {
            return GestureDetector(
              child: MyPropsCard(
                property: myProperties[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
