import 'package:filtery/get_image.dart';
import 'package:filtery/image_screen.dart';

import 'dart:typed_data';

import 'package:opencv_4/factory/pathfrom.dart';
import 'package:opencv_4/opencv_4.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

// GetImage image =  GetImage();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _fromCamera() async {
    imageFile = await GetImage().pickCropImage(
      cropAspectRatio: const CropAspectRatio(ratioX: 70, ratioY: 100),
      imageSource: ImageSource.camera,
    );
    setState(() {});
    if (imageFile == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> _fromGallery() async {
    imageFile = await GetImage().pickCropImage(
      cropAspectRatio: const CropAspectRatio(ratioX: 70, ratioY: 100),
      imageSource: ImageSource.gallery,
    );

    setState(() {
      imageFile;
    });
    if (imageFile == null) {
      return false;
    } else {
      return true;
    }
  }

  blurFilter() async {
    byte = await Cv2.medianBlur(
      pathFrom: CVPathFrom.GALLERY_CAMERA,
      pathString: imageFile!.path,
      kernelSize: 19,
    );

    setState(() {
      byte;
    });
  }
threshhold() async {
  byte2 = await Cv2.threshold(
    pathFrom: CVPathFrom.GALLERY_CAMERA,
    pathString: imageFile!.path,
    thresholdValue: 150,
    maxThresholdValue: 200,
    thresholdType: Cv2.THRESH_BINARY,
  );

  setState(() {
    byte2;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Filtery'),
        backgroundColor: Color(0xff1B4965),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xffd9d9d9),
            ),
          ),
          Container(
              width: double.infinity,
              height: 140,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () async {
                        bool res = await _fromCamera();
                        if (res) {
                          blurFilter();
                          threshhold();
                        }
                        setState(() {
                          byte;
                          byte2;
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ImageScreen();
                        }));
                      },
                      child: Image.asset(
                        'assets/camera.png',
                      )),
                  GestureDetector(
                      onTap: () async {
                        bool res = await _fromGallery();
                        if (res) {
                          blurFilter();
                          threshhold();
                        }
                        setState(() {
                          byte;
                          byte2;
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ImageScreen();
                        }));
                      },
                      child: Image.asset(
                        'assets/gallary.png',
                      )),
                ],
              )),
        ],
      ),
    );
  }
}

XFile? imageFile;
Uint8List? byte;
Uint8List? byte2;
