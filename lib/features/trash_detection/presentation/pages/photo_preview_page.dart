import 'dart:io';
import 'package:flutter/material.dart';
import 'package:binbahadhur/features/trash_detection/presentation/pages/ml_service.dart';

class PhotoPreviewPage extends StatefulWidget {
  final File imageFile;
  const PhotoPreviewPage({super.key, required this.imageFile});

  @override
  State<PhotoPreviewPage> createState() => _PhotoPreviewPageState();
}

class _PhotoPreviewPageState extends State<PhotoPreviewPage> {
  String predictedLabel = "Predicting...";
  final MlService mlService = MlService();

  @override
  void initState() {
    super.initState();
    loadModelAndPredict();
  }

  Future<void> loadModelAndPredict() async {
    try {
      await mlService.loadModel();
      int classIndex = await mlService.predict(widget.imageFile);

      List<String> labels = [
        "battery",
        "biological",
        "cardboard",
        "clothes",
        "glass",
        "metal",
        "paper",
        "plastic",
        "shoes",
        "trash",
      ];

      if (!mounted) return; // ✅ important
      setState(() {
        predictedLabel = classIndex >= 0 ? labels[classIndex] : "Unknown";
      });
    } catch (e) {
      print("Model loading/predicting failed: $e");
      if (!mounted) return;
      setState(() {
        predictedLabel = "Prediction failed";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Photo Preview")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.file(widget.imageFile, width: 250),
          const SizedBox(height: 20),
          Text(
            "Prediction: $predictedLabel",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Retake"),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // Here you can save the photo or upload to backend
                  print("Photo Saved!");
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
