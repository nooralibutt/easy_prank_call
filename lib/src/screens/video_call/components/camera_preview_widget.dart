import 'package:camera/camera.dart';
import 'package:easy_prank_call/src/utilities/size_config.dart';
import 'package:flutter/material.dart';

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController? _controller;

  @override
  void initState() {
    super.initState();

    _initializeCamera();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.length < 2) return;

    _controller = CameraController(cameras[1], ResolutionPreset.medium);
    _controller?.initialize().then((_) {
      if (!mounted) return;

      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return const SizedBox();
    }

    return SizedBox(
      width: getProportionateScreenWidth(150),
      height: getProportionateScreenHeight(200),
      child: CameraPreview(controller),
    );
  }
}
