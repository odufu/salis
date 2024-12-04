import 'package:cicdtest/salis/props/data/property.dart';
import 'package:flutter/material.dart';
import 'widgets/product_card.dart';

class Property extends StatelessWidget {
  const Property({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Added const for static values
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/roundedLogo.png",
                    color: Theme.of(context).colorScheme.primary,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 45,
                      child: SearchBar(
                        leading: Icon(Icons.search),
                        hintText: "Search Here...",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Removed const for dynamic images

            Expanded(
              child: ListView.builder(
                  itemCount: newProperties.length,
                  itemBuilder: (context, index) {
                    return ProductCard(property: newProperties[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
