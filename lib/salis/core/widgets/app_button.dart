import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final void Function()? onPress;
  const AppButton({
    this.width,
    this.backgroundColor,
    this.textColor,
    required this.text,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Container(
          width: width ?? 150,
          decoration: BoxDecoration(
              color: backgroundColor ?? Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      color:
                          textColor ?? Theme.of(context).colorScheme.surface),
                ),
              ],
            ),
          )),
    );
  }
}
