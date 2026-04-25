import 'package:flutter/material.dart';
import 'package:binbahadhur/core/widgets/custom_app_bar.dart';
import 'package:binbahadhur/core/widgets/custom_big_button.dart';
import 'package:binbahadhur/features/levels/presentation/levels.dart';
import 'package:binbahadhur/core/theme/app_pallete.dart';

class CurrentLevelPage extends StatelessWidget {
  const CurrentLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Levels"),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/fohor_rookie.png",
                    height: 140,
                    width: 140,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Fohor Rookie",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppPallete.backgroundColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 30,
              left: 170,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green),
                ),
                child: const Text(
                  "I'M HERE",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 220,
              right: 20,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/general_garbage.png",
                    height: 140,
                    width: 140,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "General Garbage",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppPallete.backgroundColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 140,
              left: 20,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/binbahadur.png",
                    height: 140,
                    width: 140,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Bin Bahadur",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppPallete.backgroundColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: CustomBigButton(
                text: "Learn More",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LevelsPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
