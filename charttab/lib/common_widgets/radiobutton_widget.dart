import 'package:flutter/material.dart';

class RadioListTileWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color borderColor;
  final Color defaultTextColor;
  final double horizontalPadding;

  const RadioListTileWidget({
    Key? key,
    required this.isSelected,
    required this.label,
    required this.onTap,
    this.borderColor = Colors.white,
    this.defaultTextColor = Colors.black26,
    this.horizontalPadding = 22,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? Colors.blueAccent : Colors.grey,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              label.trimLeft().trim(),
              textAlign: TextAlign.left,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF41414e),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
