import 'package:flutter/material.dart';

class AppTextInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool isObscure;
  final TextEditingController controller;
  void Function(String)? onChanged;
  final Widget? leadingIcon; // Add an optional leading icon

  AppTextInput({
    super.key,
    required this.hintText,
    this.onChanged,
    required this.labelText,
    this.isObscure = false,
    required this.controller,
    this.leadingIcon, // Initialize leadingIcon
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: isObscure,
                controller: controller,
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 12),
                  prefixIcon: leadingIcon, // Add leadingIcon here
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "$hintText is empty";
                  }
                  return null;
                },
              ),
            ),
            Positioned(
              top: -3,
              left: 0,
              child: Container(
                color: Theme.of(context).colorScheme.surface,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  hintText,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
