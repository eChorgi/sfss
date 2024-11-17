import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sfss/config/roughter.dart';
import 'package:sfss/data/device_data.dart';
import 'package:vibration/vibration.dart';


void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  DeviceData.hasVibrator = await Vibration.hasVibrator() ?? false;
  DeviceData.hasAmplitudeControl = await Vibration.hasAmplitudeControl() ?? false;

  DeviceData.cameras = await availableCameras().catchError((Object e){
    print(e);
    return <CameraDescription>[];
  });
  runApp(CupertinoApp(
    debugShowCheckedModeBanner: false,
    theme: const CupertinoThemeData(brightness: Brightness.light),
    title: '四方食事',
    initialRoute: '/',
    routes: appRoutes,
  ));
}
