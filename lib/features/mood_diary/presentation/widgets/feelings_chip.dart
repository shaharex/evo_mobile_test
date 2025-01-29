import 'package:evo_mobile_test/core/core.dart';
import 'package:evo_mobile_test/features/mood_diary/presentation/state/mood_state.dart';
import 'package:flutter/material.dart';

class FeelingChip extends StatelessWidget {
  FeelingChip({super.key, required this.onTap, required this.feeling});

  void Function()? onTap;
  final _moodState = MoodState();
  final String feeling;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: _moodState.selectedFeelings == feeling
            ? AppColors.mandarinColor
            : Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xffB6A1C0).withOpacity(0.2),
            blurRadius: 2,
            offset: const Offset(1, 2),
          )
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          feeling,
          style: TextStyle(
            fontSize: 16,
            color: _moodState.selectedFeelings == feeling
                ? Colors.white
                : AppColors.fontColor,
          ),
        ),
      ),
    );
  }
}
