import 'dart:io';

import 'package:flutter/material.dart';

import '../home_screen.dart';

class CropeWidget extends StatefulWidget {
  const CropeWidget({Key? key}) : super(key: key);

  @override
  State<CropeWidget> createState() => _CropeWidgetState();
}

class _CropeWidgetState extends State<CropeWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: imageFile != null
          ? GestureDetector(
              onTap: () {

                setState(() {});
              },
              child: Image(
                image: FileImage(
                  File(
                    imageFile!.path,
                  ),
                ),
              ),
            )
          : const Text('no image'),
    );
  }
}
