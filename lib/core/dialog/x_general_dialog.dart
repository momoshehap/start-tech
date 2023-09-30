import 'package:flutter/material.dart';

import 'general_dialog.dart';

extension XGeneralDialog on BuildContext {
  showGeneralDialog({
    required String image,
    String? title,
    String? description,
    Function? onConfirm,
    Function? onCancel,
    String? confirmText,
    String? cancelText,
    bool? barrierDismissible,
  }) {
    showDialog(
        context: this,
        // will be dismissible if no confirm or cancel action is provided
        // barrierDismissible: onConfirm == null && onCancel == null,
        barrierDismissible: barrierDismissible ?? true,
        builder: (dialogContext) {
          return Dialog(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: GeneralDialog(
                image: image,
                title: title,
                description: description,
                onConfirm: onConfirm,
                onCancel: onCancel,
                confirmText: confirmText,
                cancelText: cancelText,
              ));
        });
  }
}
