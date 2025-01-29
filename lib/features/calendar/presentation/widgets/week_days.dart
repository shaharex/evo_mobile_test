import 'package:evo_mobile_test/core/core.dart';
import 'package:evo_mobile_test/features/calendar/presentation/state/calendar_state.dart';
import 'package:flutter/material.dart';

class WeekDays extends StatelessWidget {
  const WeekDays({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        7,
        (index) {
          return Text(
            " ${CalendarState().weekDays[index]} ",
            style: const TextStyle(color: AppColors.grayColor, fontSize: 14),
          );
        },
      ),
    );
  }
}
