import 'package:flutter/material.dart';
import 'package:evo_mobile_test/features/mood_diary/presentation/pages/mood_diary_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoodDiaryPage(),
    );
  }
}
