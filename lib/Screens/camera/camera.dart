// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/Shared/constaness/constanesApp.dart';
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
    // intalizecamera();
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
        numResults: 9, // defaults to 5
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

  Future<void> get_image({required ImageSource imageSource}) async {
    final PickedFile = await picker.pickImage(source: imageSource);
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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    Util(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          checkimage(h: h, w: w)
          // checkcamra()
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (controller != null) {
      controller!.dispose();
    }
  }

  Widget checkimage({required double h, required double w}) {
    return Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          pickedimage != null
              ? Image.file(
                  pickedimage!,
                  width: w,
                  height: h / 3,
                  fit: BoxFit.fill,
                )
              : const Image(image: AssetImage('assets/images/spalsh.jpg')),
          ElevatedButton(
              onPressed: () async {
                showmoda(context: context);
              },
              // ignore: prefer_const_constructors
              child: Text(
                'Upload your image',
                style: const TextStyle(color: Colors.black),
              )),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: pickedimage != null
                  ? () {
                      runmodel_image();
                    }
                  : null,
              child: const Text('Check your image')),
          pickedimage != null
              ? Text(
                  output,
                  style: const TextStyle(color: Colors.black),
                )
              : Container()
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
                  width: 400, height: 224, child: CameraPreview(controller!)),
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

  void showmoda({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      get_image(imageSource: ImageSource.gallery);
                    },
                    child: const Text(
                      'gallery',
                      style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      get_image(imageSource: ImageSource.camera);
                    },
                    child: const Text(
                      'camera',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ));
  }
}
