import 'package:flutter/material.dart';

import '../home_screen.dart';

class ThreshHoldWidget extends StatefulWidget {
  const ThreshHoldWidget({super.key});

  @override
  State<ThreshHoldWidget> createState() => _ThreshHoldWidgetState();
}

class _ThreshHoldWidgetState extends State<ThreshHoldWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: byte2 != null
          ? GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Image.memory(
                byte2!,
              ))
          : const Text('no image'),
    );
  }
}
