import '../../../../core/core.dart';

class CalendarState {
  List<String> get weekDays => DateUtilsHelper.getWeekDays();
  List<String> get monthList => DateUtilsHelper.getMonthList();

  List<int> getCalendarDays(monthIndex) {
    int year = DateTime.now().year;
    int daysInMonth = DateTime(year, monthIndex + 2, 0).day;
    int firstWeekDay = DateTime(year, monthIndex + 1).weekday - 1;

    List<int> calendarDays = List.filled(firstWeekDay, 0) +
        List.generate(daysInMonth, (index) => index + 1);

    return calendarDays;
  }
}
