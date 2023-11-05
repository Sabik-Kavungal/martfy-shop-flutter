import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key, required this.text, this.size, this.color, this.onClick})
      : super(key: key);
  final String text;
  final double? size;
  final dynamic color;
  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Text(
        text ?? '',
        style: TextStyle(
          fontSize: size ?? 18,
          color: color ?? Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}