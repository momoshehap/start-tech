import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../strings.dart';

class CustomFormField extends StatefulWidget {
  final String label;
  final String? title;
  final Function(String?)? onSave;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isSecretValue;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final int lengthLimit;
  final bool enabled;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? onEditingComplete;

  const CustomFormField({
    required this.label,
    required this.validate,
    this.title,
    this.onSave,
    this.controller,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.name,
    this.isSecretValue = false,
    this.enabled = true,
    this.lengthLimit = 0,
    this.leading,
    this.trailing,
    this.onEditingComplete,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontFamily: 'AlexandriaFLF'),
          ),
          const SizedBox(height: 8)
        ],
        TextFormField(
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          obscureText: widget.isSecretValue ? obscure : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: widget.lengthLimit == 0
              ? null
              : [
                  LengthLimitingTextInputFormatter(widget.lengthLimit),
                ],
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
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            border: _border,
            focusedBorder: _border,
            enabledBorder: _border,
            

            prefixIcon: widget.leading,
            suffixIcon: widget.trailing ?? (widget.isSecretValue
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        child: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                      )
                    : null),
          ),
          onChanged: widget.onChanged,
          validator: widget.validate,
          onSaved: widget.onSave,
          onEditingComplete: widget.onEditingComplete,
        ),
      ],
    );
  }

  // border
  final OutlineInputBorder _border =  const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(24)),
  borderSide: BorderSide(
  width: 0,
  style: BorderStyle.solid,
  color: AppColors.gray30,
  ),
  );
}
