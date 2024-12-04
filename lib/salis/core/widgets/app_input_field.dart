import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  final bool? isObscure;
  final String hint;
  final Color? backgroundColor;
  final IconData? surfixIcon;
  final bool? isPassword;
  final Color? textColor;
  const AppInputField({
    this.isPassword,
    this.surfixIcon,
    this.isObscure,
    this.textColor,
    this.backgroundColor,
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Text(
          //   hint,
          //   textAlign: TextAlign.start,
          //   style: TextStyle(
          //       color: Theme.of(context).colorScheme.surface,
          //       fontWeight: FontWeight.w100),
          // ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                obscureText: isObscure ?? false,
                cursorColor: Theme.of(context).colorScheme.primary,
                cursorWidth: 1,
                cursorHeight: 15,
                decoration: InputDecoration(
                    label: Text(
                  style: const TextStyle(fontWeight: FontWeight.w100),
                  hint,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
