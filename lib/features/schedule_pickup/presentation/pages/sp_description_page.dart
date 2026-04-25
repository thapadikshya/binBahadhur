import 'dart:io';
import 'package:binbahadhur/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:binbahadhur/core/widgets/custom_app_bar.dart';
import 'package:binbahadhur/core/widgets/custom_big_button.dart';

class SPSaveDetailsPage extends StatefulWidget {
  final File imageFile;
  final String prediction;

  const SPSaveDetailsPage({
    super.key,
    required this.imageFile,
    required this.prediction,
  });

  @override
  State<SPSaveDetailsPage> createState() => _SPSaveDetailsPageState();
}

class _SPSaveDetailsPageState extends State<SPSaveDetailsPage> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController predictionController = TextEditingController();

  final Map<String, double> pricePerKg = {
    "Battery": 80,
    "Biological": 10,
    "Cardboard": 15,
    "Clothes": 30,
    "Glass": 20,
    "Metal": 100,
    "Paper": 12,
    "Plastic": 25,
    "Shoes": 40,
    "Trash": 5,
  };

  late double pricePerKgValue;
  double weight = 1;
  late double estimatedPrice;

  @override
  void initState() {
    super.initState();
    predictionController.text = widget.prediction;

    pricePerKgValue = pricePerKg[widget.prediction] ?? 0;
    estimatedPrice = pricePerKgValue * weight;
  }

  @override
  void dispose() {
    controller.dispose();
    predictionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Schedule and Pickup"),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Snap Picture",
                style: TextStyle(fontSize: 16, color: AppPallete.blackColor),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    widget.imageFile,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                readOnly: true,
                controller: predictionController,
                style: const TextStyle(color: AppPallete.blackColor),
                decoration: const InputDecoration(
                  labelText: "Detected Type",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "Price per kg: Rs ${pricePerKgValue.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppPallete.blackColor,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "Description",
                style: TextStyle(fontSize: 16, color: AppPallete.blackColor),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: controller,
                maxLines: 3,
                style: const TextStyle(color: AppPallete.blackColor),
                decoration: const InputDecoration(
                  hintText: "Write description...",
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: AppPallete.greyColor),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: CustomBigButton(
                  text: "Submit",
                  onPressed: () {
                    print("Description: ${controller.text}");
                    print("Prediction: ${widget.prediction}");
                    print("Price per kg: $pricePerKgValue");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
