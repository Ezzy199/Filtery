import 'dart:io';
import 'package:camera/camera.dart';
import 'package:filtery/home_screen.dart';
import 'package:filtery/widgets/blur.dart';
import 'package:filtery/widgets/crope_widget.dart';
import 'package:filtery/widgets/map_color.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'get_image.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});


  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  List <Widget> widgets = [
    CropeWidget(),
    ThreshHoldWidget(),
    BlurWidget(),

  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          currentIndex = index;
          setState(() {

          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'crop',
            icon: Icon(
              Icons.crop,
            ),
          ),
          BottomNavigationBarItem(
            label: 'filter 1',
            icon: Icon(
              Icons.filter,
            ),
          ),
          BottomNavigationBarItem(
            label: 'blur',
            icon: Icon(
              Icons.blur_circular,
            ),
          ),
        ],
      ),
    );
  }
}
