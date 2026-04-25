import 'dart:io';
import 'package:binbahadhur/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:binbahadhur/features/trash_detection/presentation/pages/ml_service.dart';
import 'package:binbahadhur/core/widgets/custom_app_bar.dart';
import 'package:binbahadhur/core/widgets/custom_button.dart';
import 'package:binbahadhur/core/widgets/custom_card.dart';
import 'package:binbahadhur/features/report_and_reward/presentation/pages/rr_description_page.dart';
import 'package:binbahadhur/features/schedule_pickup/presentation/pages/sp_description_page.dart';

class PhotoPreviewPage extends StatefulWidget {
  final File imageFile;
  final String mode;
  const PhotoPreviewPage({
    super.key,
    required this.imageFile,
    required this.mode,
  });

  @override
  State<PhotoPreviewPage> createState() => _PhotoPreviewPageState();
}

class _PhotoPreviewPageState extends State<PhotoPreviewPage> {
  String predictedLabel = "Predicting...";
  final MlService mlService = MlService();

  @override
  void initState() {
    super.initState();
    if (widget.mode == "schedule") {
      loadModelAndPredict();
    } else {
      predictedLabel = "No prediction needed";
    }
  }

  Future<void> loadModelAndPredict() async {
    try {
      await mlService.loadModel();
      int classIndex = await mlService.predict(widget.imageFile);

      List<String> labels = [
        "Battery",
        "Biological",
        "Cardboard",
        "Clothes",
        "Glass",
        "Metal",
        "Paper",
        "Plastic",
        "Shoes",
        "Trash",
      ];

      if (!mounted) return;
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
      appBar: const CustomAppBar(title: "Photo Preview", showBackButton: true),
      body: Container(
        color: Colors.white,
        child: Center(
          child: CustomCard(
            color: AppPallete.backgroundColor.withOpacity(0.2),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.file(widget.imageFile, width: 250),

                const SizedBox(height: 20),
                if (widget.mode == "schedule")
                  Text(
                    "Prediction: $predictedLabel",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppPallete.backgroundColor,
                    ),
                  )
                else
                  const SizedBox.shrink(),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      color: AppPallete.backgroundColor,
                      text: "Retake",
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 20),
                    CustomButton(
                      color: AppPallete.backgroundColor,
                      text: "Save",
                      onPressed: () {
                        Widget page;

                        if (widget.mode == "report") {
                          page = RRSaveDetailsPage(imageFile: widget.imageFile);
                        } else if (widget.mode == "schedule") {
                          page = SPSaveDetailsPage(
                            imageFile: widget.imageFile,
                            prediction: predictedLabel,
                          );
                        } else {
                          page = RRSaveDetailsPage(
                            imageFile: widget.imageFile,
                          ); // fallback
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => page),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
