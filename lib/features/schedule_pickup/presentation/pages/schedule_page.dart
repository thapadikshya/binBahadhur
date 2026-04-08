import 'package:binbahadhur/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:binbahadhur/features/trash_detection/presentation/pages/camera_page.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Schedule Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppPallete.backgroundColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Report button
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CameraPage(),
                      ),
                    );
                  },
                  child: Icon(Icons.camera, size: 50, color: Colors.green),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Text(
              "Snap Picture",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),

            // Reward button
          ],
        ),
      ),
    );
  }
}
