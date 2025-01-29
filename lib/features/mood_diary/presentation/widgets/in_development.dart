import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class InDevelopment extends StatelessWidget {
  const InDevelopment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 50),
          Icon(
            Icons.auto_awesome,
            color: AppColors.mandarinColor,
            size: 100,
          ),
          SizedBox(height: 10),
          Text(
            "Данная страница скоро будет доступна.",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
