import 'package:flutter/material.dart';

import '../strings.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final Color color;
  final String? text;
  final TextStyle? textStyle;
  final Widget? child;

  const CustomOutlinedButton({
    Key? key,
    this.text,
    this.onPressed,
    this.textStyle,
    this.child,
    this.color = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: child ??
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: text == null
                  ? const SizedBox()
                  : FittedBox(
                child: Text(
                  text!,
                  maxLines: 1,
                  // TODO: Add a default text style
                  /// disabled color will always be whit even if using a custom text style
                  style: TextStyle(
                    color:  AppColors.primary,
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
