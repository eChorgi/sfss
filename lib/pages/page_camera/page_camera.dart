import 'dart:io';

import 'package:extra_hittest_area/extra_hittest_area.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sfss/data/device_data.dart';
import 'package:vibration/vibration.dart';

class PageCamera extends StatefulWidget {
  @override
  _PageCameraState createState() => _PageCameraState();
}

class _PageCameraState extends State<PageCamera> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription>? _cameras;
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    if(DeviceData.cameras.isEmpty){
      Navigator.of(context).pop(null);
      return;
    }
    _controller = CameraController(DeviceData.cameras[0], ResolutionPreset.max);
    _controller!.initialize().then((_){
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e){
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    }); 
  }

  Future<void> _takePicture() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 1000);
    }
    if (!_controller!.value.isInitialized) {
      return;
    }
    if (_controller!.value.isTakingPicture) {
      return;
    }

    try {
      _imageFile = await _controller!.takePicture();
      //保存
      await _saveImageToGallery(_imageFile!);
      setState(() {});
    } catch (e) {
      print(e);
    }
    Navigator.of(context).pop(Image.file(File(_imageFile!.path)));
  }
  Future<void> _saveImageToGallery(XFile imageFile) async {
    // 请求存储权限
    if (await Permission.storage.request().isGranted) {
      // 保存图片到相册
      final result = await ImageGallerySaver.saveImage(
          await imageFile.readAsBytes(),
          quality: 80,
          name: 'test');
      if (result['isSuccess']) {
        // 保存成功
        print('图片保存成功');
      } else {
        // 保存失败
        print('图片保存失败');
      }
    } else {
      // 用户拒绝了权限请求
      print('无法保存图片，请先授权');
    }
  }
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Camera Page'),
      // ),
      body: Stack(
        children: [
            Center(
            child: AspectRatio(
              aspectRatio: 1.0/_controller!.value.aspectRatio,
              child: CameraPreview(_controller!),
            ),
            ),
          Align(
            alignment: Alignment(0, 0.9),
            child: GestureDetectorHitTestWithoutSizeLimit(
              extraHitTestArea: EdgeInsets.all(20),
              child: Icon(Icons.camera_alt, color: Colors.black,),
              onTap: _takePicture,
            ),
          )
        ]
      ),
    );
  }
}