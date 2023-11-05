import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.color,
      required this.onClick,
      required this.name})
      : super(key: key);
  final dynamic color;
  final VoidCallback onClick;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.5),
      child: InkWell(
        onTap: onClick,
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Center(
              child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
        ),
      ),
    );
  }
}
