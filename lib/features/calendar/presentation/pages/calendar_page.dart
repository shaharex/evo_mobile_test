import 'package:evo_mobile_test/core/constants/app_colors.dart';
import 'package:evo_mobile_test/features/calendar/presentation/state/calendar_state.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final _calendarState = CalendarState();

  double _scale = 0.0;
  double _previousScale = 0.0;
  bool _isGridMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _isGridMode ? _buildYearText() : const WeekDays(),
            const SizedBox(height: 10),
            _buildCalendar(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      surfaceTintColor: AppColors.grayColor.withOpacity(0.1),
      backgroundColor: AppColors.backgroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
          color: AppColors.grayColor,
          size: 25,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isGridMode = !_isGridMode;
            });
          },
          child: const Text(
            "Сегодня",
            style: TextStyle(
              color: AppColors.grayColor,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Align _buildYearText() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        "2025",
        style: TextStyle(
            color: AppColors.fontColor,
            fontSize: 26,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Flexible _buildCalendar() {
    return Flexible(
      child: GestureDetector(
        onScaleStart: (details) => _previousScale = _scale,
        onScaleEnd: (details) => _previousScale = _scale,
        onScaleUpdate: (details) => handleUpdate(details),
        child: GridView.builder(
          itemCount: _calendarState.monthList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _isGridMode ? 2 : 1,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: _isGridMode
                  ? const EdgeInsets.only(right: 10.0, bottom: 15)
                  : EdgeInsets.zero,
              child: MonthWidget(
                monthList: _calendarState.monthList,
                monthIndex: index,
                dayFontSize: _isGridMode ? 12 : 18,
                monthFontSize: _isGridMode ? 16 : 22,
                showYear: _isGridMode ? false : true,
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }

  handleUpdate(details) {
    setState(() {
      _scale = _previousScale * details.scale;

      _scale = _scale.clamp(0.8, 2.0);

      if (_scale > 1.2) {
        _isGridMode = true;
      } else {
        _isGridMode = false;
      }
    });
  }
}
