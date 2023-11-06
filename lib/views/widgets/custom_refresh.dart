import 'package:flutter/material.dart';

class CustomRefresh extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const CustomRefresh({
    Key? key,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.blue,
      color: Colors.red,
      displacement: 100.0,
      edgeOffset: 20.0,
      strokeWidth: 2.0,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      semanticsLabel: 'Refresh',
      semanticsValue: 'Refresh',
      onRefresh: onRefresh,
      child: child,
    );
  }
}
