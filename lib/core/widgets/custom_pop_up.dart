import 'package:evo_mobile_test/core/core.dart';
import 'package:flutter/material.dart';

class CustomPopUp extends StatelessWidget {
  CustomPopUp({
    super.key,
    required this.popUpTitle,
    required this.btnText,
    this.onTap,
  });

  final String popUpTitle;
  final String btnText;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shadowColor: AppColors.fontColor.withOpacity(0.1),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Container(
              height: 70,
              width: 70,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.mandarinColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.done,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              popUpTitle,
              style: const TextStyle(
                color: AppColors.mandarinColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: onTap,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.mandarinColor,
                ),
                child: const Text(
                  "Oк",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
