import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../strings.dart';

class CustomTextArea extends StatefulWidget {
  final String label;
  final String? title;
  final Function(String?)? onSave;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final int lengthLimit;
  final bool enabled;
  final void Function()? onEditingComplete;

  const CustomTextArea({
    required this.label,
    required this.validate,
    this.title,
    this.onSave,
    this.controller,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.multiline,
    this.enabled = true,
    this.lengthLimit = 0,
    this.onEditingComplete,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextArea> createState() => _CustomTextAreaState();
}

class _CustomTextAreaState extends State<CustomTextArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray40),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.all(8),
          child: TextFormField(
            controller: widget.controller,
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            maxLines: 4,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: widget.lengthLimit == 0
                ? null
                : [
                    LengthLimitingTextInputFormatter(widget.lengthLimit),
                  ],
            maxLength: 300,
            decoration: InputDecoration(
              hintText: widget.label,
              errorStyle: Theme.of(context).textTheme.caption!.copyWith(
                    color: Colors.red,
                  ),
              filled: true,
              fillColor: AppColors.white,
              errorMaxLines: 4,
              enabled: widget.enabled,
              labelStyle: const TextStyle(color: Colors.grey),
              contentPadding:  EdgeInsets.zero,
              border: InputBorder.none,
            ),
            onChanged: widget.onChanged,
            validator: widget.validate,
            onSaved: widget.onSave,
            onEditingComplete: widget.onEditingComplete,
          ),
        ),
      ],
    );
  }
}
