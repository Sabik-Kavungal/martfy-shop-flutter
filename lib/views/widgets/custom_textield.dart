import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final FocusNode focusNode;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final ValueChanged<String>? onFieldSubmitted;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.textInputType,
    this.prefixIcon,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.5),
      child: TextFormField(
        minLines: maxLines ?? 1,
        controller: controller,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: textInputType ?? TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black38,
            )),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black38,
            ))),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your $hintText';
          }
          return null;
        },
        maxLines: maxLines,
      ),
    );
  }
}
