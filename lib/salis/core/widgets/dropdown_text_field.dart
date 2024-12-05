import 'package:flutter/material.dart';

class DropdownTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final List<String> items;
  final String? selectedValue;
  final Widget? leadingIcon;
  final ValueChanged<String?> onChanged;

  const DropdownTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.items,
    this.selectedValue,
    this.leadingIcon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure selectedValue is either null or contained in items
    final effectiveSelectedValue =
        items.contains(selectedValue) ? selectedValue : null;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: effectiveSelectedValue,
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 12),
                  prefixIcon: leadingIcon,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: items.toSet().map((String item) {
                  // Convert items to Set to ensure uniqueness
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: onChanged,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "$hintText is required";
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
