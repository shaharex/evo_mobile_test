import 'package:evo_mobile_test/core/core.dart';
import 'package:flutter/material.dart';

class MoodState {
  List<String> get emotionsList => MoodUtilsHelper().getEmotionsList();
  List<String> get imagePath => MoodUtilsHelper().getImagePath();
  List<String> get feelingsList => MoodUtilsHelper().getFeelingsList();

  final TextEditingController noteController = TextEditingController();
  String selectedMood = '';
  String selectedFeelings = '';
  double valueStress = 0.0;
  double valueSelf = 0.0;

  String getMonth(int month) {
    List<String> monthList = [
      "Января",
      "Февраля",
      "Марта",
      "Апреля",
      "Май",
      "Июня",
      "Июля",
      "Августа",
      "Сентября",
      "Октября",
      "Ноября",
      "Декабря",
    ];
    return monthList[month - 1];
  }

  clearData() {
    noteController.clear();
    selectedMood = '';
    selectedFeelings = '';
    valueStress = 0.0;
    valueSelf = 0.0;
  }
}
