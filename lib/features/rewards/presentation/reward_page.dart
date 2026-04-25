import 'package:binbahadhur/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:binbahadhur/core/widgets/custom_app_bar.dart';
import 'package:binbahadhur/core/widgets/custom_big_button.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  int currentIndex = 0;

  int points = 1;

  late String imagePath;
  late List<String> messages;

  @override
  void initState() {
    super.initState();

    if (points <= 5) {
      imagePath = "assets/images/fohor_rookie.png";
      messages = [
        "Congratulations! You earned a point!",
        "Closer to becoming General Garbage!",
        "Hardwork Pays!",
      ];
    } else if (points <= 25) {
      imagePath = "assets/images/general_garbage.png";
      messages = [
        "Congratulations! You earned a point!",
        "Closer to becoming binBahadur!",
        "Hardwork Pays!",
      ];
    } else {
      imagePath = "assets/images/binbahadur.png";
      messages = [
        "LEGEND! Maximum level unlocked!",
        "You are Binbahadur now!",
        "Unlock new rewards by recycling more!",
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Rewards"),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                messages[currentIndex],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppPallete.blackColor),
              ),
              const SizedBox(height: 20),
              Image.asset(imagePath, height: 360),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: CustomBigButton(
                  text: "Continue",
                  onPressed: () {
                    if (currentIndex < messages.length - 1) {
                      setState(() {
                        currentIndex++;
                      });
                    } else {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
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
