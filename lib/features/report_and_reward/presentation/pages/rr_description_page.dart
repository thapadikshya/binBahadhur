import 'dart:io';
import 'package:binbahadhur/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:binbahadhur/core/widgets/custom_app_bar.dart';
import 'package:binbahadhur/core/widgets/custom_big_button.dart';

class RRSaveDetailsPage extends StatefulWidget {
  final File imageFile;

  const RRSaveDetailsPage({super.key, required this.imageFile});

  @override
  State<RRSaveDetailsPage> createState() => _RRSaveDetailsPageState();
}

class _RRSaveDetailsPageState extends State<RRSaveDetailsPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Report & Reward"),

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
                    print(controller.text); // or your logic
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
