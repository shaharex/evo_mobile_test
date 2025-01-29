import 'package:evo_mobile_test/core/core.dart';
import 'package:flutter/material.dart';

class MoodWidget extends StatelessWidget {
  const MoodWidget(
      {super.key,
      required this.selectedMood,
      required this.title,
      required this.imagePath,
      required this.onTap});

  final String selectedMood;
  final String title;
  final String imagePath;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 85,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 249, 249, 249),
          border: selectedMood == imagePath
              ? Border.all(
                  color: AppColors.mandarinColor,
                  width: 2,
                )
              : null,
          boxShadow: [
            BoxShadow(
                color: const Color(0xffB6A1C0).withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(2, 4))
          ],
          borderRadius: BorderRadius.circular(70),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/emotions/$imagePath.png",
            ),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.fontColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
