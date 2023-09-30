import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../buttons/custom_button.dart';
import '../strings.dart';

class GeneralDialog extends StatelessWidget {
  final String image;
  final String? title;
  final String? description;
  final Function? onConfirm;
  final Function? onCancel;
  final String? confirmText;
  final String? cancelText;

  const GeneralDialog(
      {required this.image,
      this.title,
      this.description,
      this.onConfirm,
      this.onCancel,
      this.confirmText,
      this.cancelText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 52, 16, 32),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.gray30,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         SvgPicture.asset(image, width: 100, height: 100),
          const SizedBox(height: 24),
          if (title != null) ...[
            Text(
              title!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
          ],
          if (description != null) ...[
            Text(
              description!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.gray30,
              ),
            ),
            const SizedBox(height: 48),
          ],
            Row(
              children: [
                       if (onConfirm != null && confirmText != null) ...[
   Expanded(child: CustomButton(text: confirmText!, onPressed: () => onConfirm!())),],
               if (onCancel != null && cancelText != null) ...[
            const SizedBox(width: 10),
                        Expanded(child: CustomButton(text: cancelText!, onPressed: () => onCancel!())),

           
          ],
              ],
            ),
          
         
        ],
      ),
    );
  }
}
