import 'package:evo_mobile_test/features/calendar/presentation/state/calendar_state.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class MonthWidget extends StatelessWidget {
  MonthWidget({
    super.key,
    required this.monthList,
    required this.monthIndex,
    required this.dayFontSize,
    required this.monthFontSize,
    required this.showYear,
    required this.onTap,
  });

  final List<String> monthList;
  final int monthIndex;
  final double dayFontSize;
  final double monthFontSize;
  final bool showYear;
  final void Function()? onTap;

  final _calState = CalendarState();

  @override
  Widget build(BuildContext context) {
    List<int> calendarDays = _calState.getCalendarDays(monthIndex);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showYear
            ? const Text(
                " 2025",
                style: TextStyle(
                    color: AppColors.grayColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            : const SizedBox(),
        Text(
          " ${monthList[monthIndex]}",
          style: TextStyle(
            color: AppColors.fontColor,
            fontWeight: FontWeight.bold,
            fontSize: monthFontSize,
          ),
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7),
            itemCount: calendarDays.length,
            itemBuilder: (context, dayIndex) {
              return calendarDays[dayIndex] == 0
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: onTap,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: monthIndex + 1 == DateTime.now().month &&
                                calendarDays[dayIndex] == DateTime.now().day
                            ? BoxDecoration(
                                color: AppColors.mandarinColor.withOpacity(0.1),
                                shape: BoxShape.circle,
                              )
                            : null,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " ${calendarDays[dayIndex]} ",
                              style: TextStyle(fontSize: dayFontSize),
                            ),
                            showYear
                                ? monthIndex + 1 == DateTime.now().month &&
                                        calendarDays[dayIndex] ==
                                            DateTime.now().day
                                    ? Container(
                                        width: 5,
                                        height: 5,
                                        decoration: const BoxDecoration(
                                          color: AppColors.mandarinColor,
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    : const SizedBox()
                                : const SizedBox()
                          ],
                        ),
                      ),
                    );
            },
          ),
        )
      ],
    );
  }
}
