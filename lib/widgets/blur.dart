import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../home_screen.dart';


class BlurWidget extends StatefulWidget {
  const BlurWidget({Key? key}) : super(key: key);

  @override
  State<BlurWidget> createState() => _BlurWidgetState();
}

class _BlurWidgetState extends State<BlurWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: byte != null
          ? GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Image.memory(
                  byte!,
              )
            )
          : const Text('no image'),
    );
  }
}
