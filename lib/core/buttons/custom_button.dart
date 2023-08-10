import 'package:flutter/material.dart';
import '../strings.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final Color color;
  final String? text;
  final TextStyle? textStyle;
  final Widget? child;

  const CustomButton({
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
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed != null ? color : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: AppColors.primary,
          elevation: 0,
        ),
        child: child ??
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: text == null || text!.isEmpty
                  ? const SizedBox()
                  : FittedBox(
                      child: Text(
                        text!,
                        maxLines: 1,
                        // TODO: Add a default text style
                        /// disabled color will always be whit even if using a custom text style
                        style: (textStyle)?.copyWith(
                          color: onPressed == null ? Colors.white : null,
                        ),
                      ),
                    ),
            ),
      ),
    );
  }
}
