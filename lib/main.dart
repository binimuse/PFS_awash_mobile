// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:awashfeedback/connectvity.dart';
import 'package:awashfeedback/constants.dart';
import 'package:awashfeedback/splash/error.dart';
import 'package:awashfeedback/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.camera.request();
  await Permission.microphone.request();
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Map _source = {ConnectivityResult.none: false};
MyConnectivity _connectivity = MyConnectivity.instance;
bool isconected = false;

class _MyHomePageState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.none:
        setState(() {
          isconected = false;
        });

        // ignore: avoid_print

        break;
      case ConnectivityResult.mobile:
        setState(() {
          isconected = true;
        });
        // ignore: avoid_print

        break;
      case ConnectivityResult.wifi:
        setState(() {
          isconected = true;
        });

      // ignore: avoid_print

    }
    return isconected
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Public Feedback System',
            theme: ThemeData(
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: Colors.white,
            ),
            home: const SplashScreen(),
            builder: EasyLoading.init(),
          )
        : buildUnAuthScreen();
  }

  buildUnAuthScreen() {
    return MaterialApp(
      title: 'Public Feedback System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ConnectionFaildScreen(),
    );
  }
}
