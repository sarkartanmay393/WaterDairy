import 'package:flutter/material.dart';

class WidgetMaker extends StatelessWidget {
  const WidgetMaker({Key? key, required this.object}) : super(key: key);
  final object;

  @override
  Widget build(BuildContext context) {
    return object();
  }
}
