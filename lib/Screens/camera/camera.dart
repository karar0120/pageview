// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ModelPage extends StatefulWidget {
  late List<CameraDescription> cameras;
  ModelPage({Key? key, required this.cameras}) : super(key: key);

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  CameraController? controller;
  CameraImage? _cameraImage;
  String output = 'data';
  File? pickedimage;
  var picker = ImagePicker();
  int change_camera = 0;

  @override
  void initState() {
    super.initState();
    loadmodel();
    intalizecamera();
  }

  void intalizecamera() {
    controller = CameraController(widget.cameras[1], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        controller!.startImageStream((image) {
          _cameraImage = image;
          runmodel_frame();
        });
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  void runmodel_frame() async {
    if (_cameraImage != null) {
      try {
        var prediction = await Tflite.runModelOnFrame(
            bytesList: _cameraImage!.planes.map((plane) {
              return plane.bytes;
            }).toList(), // required
            imageHeight: _cameraImage!.height,
            imageWidth: _cameraImage!.width,
            imageMean: 127.5, // defaults to 127.5
            imageStd: 127.5, // defaults to 127.5
            rotation: 90, // defaults to 90, Android only
            numResults: 4, // defaults to 5
            threshold: 0.1, // defaults to 0.1
            asynch: true // defaults to true
            );
        print(prediction);
        prediction!.forEach((element) {
          setState(() {
            output = element['label'];
          });
        });
      } catch (error) {
        print(error);
      }
    }
  }

  void runmodel_image() async {
    var recognitions2 = await Tflite.runModelOnImage(
        path: pickedimage!.path,
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 60, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );
    setState(() {
      recognitions2!.forEach((element) {
        output = element['label'];
        print(element.toString());
      });
    });
  }

  void loadmodel() async {
    await Tflite.loadModel(
        model: "assets/Model/model_unquant.tflite",
        labels: "assets/Model/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  Future<void> get_image() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      setState(() {
        pickedimage = File(PickedFile.path);
      });
    } else {
      print("Error please try again");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // checkimage()
          checkcamra()
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  Widget checkimage() {
    return Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          pickedimage != null
              ? Image.file(
                  pickedimage!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                )
              : Image(image: AssetImage('assets/download.png')),
          TextButton(
              onPressed: () async {
                get_image();
              },
              child: Text('picked')),
          TextButton(
              onPressed: () {
                runmodel_image();
              },
              child: Text('data')),
        ]);
  }

  Widget checkcamra() {
    return Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          !controller!.value.isInitialized
              ? Container(
                  width: 1,
                  height: 1,
                  color: Colors.white,
                )
              : Container(
                  width: 400, height: 400, child: CameraPreview(controller!)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                output,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      change_camera = 1 - change_camera;
                    });
                  },
                  icon: const Icon(Icons.camera_enhance))
            ],
          )
        ]);
  }
}
