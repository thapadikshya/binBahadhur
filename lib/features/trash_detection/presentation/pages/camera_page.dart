import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:binbahadhur/features/trash_detection/presentation/pages/photo_preview_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;
  XFile? imageFile;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    controller = CameraController(firstCamera, ResolutionPreset.medium);

    await controller!.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !(controller?.value.isInitialized ?? false)) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Camera")),
      body: Stack(
        children: [SizedBox.expand(child: CameraPreview(controller!))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (controller == null) return;

          final imageFile = await controller!.takePicture();
          if (!mounted) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PhotoPreviewPage(imageFile: File(imageFile.path)),
            ),
          );
        },
        child: const Icon(Icons.camera),
      ),
    );
  }
}
