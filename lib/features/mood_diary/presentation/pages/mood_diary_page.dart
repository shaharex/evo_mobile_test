import 'dart:async';
import 'package:evo_mobile_test/core/core.dart';
import 'package:evo_mobile_test/features/calendar/presentation/pages/calendar_page.dart';
import 'package:evo_mobile_test/features/mood_diary/presentation/state/mood_state.dart';
import 'package:evo_mobile_test/features/mood_diary/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MoodDiaryPage extends StatefulWidget {
  const MoodDiaryPage({super.key});

  @override
  State<MoodDiaryPage> createState() => _MoodDiaryPageState();
}

class _MoodDiaryPageState extends State<MoodDiaryPage> {
  final _moodState = MoodState();
  bool _selectedTab = true;

  late DateTime _currentTime;
  late Timer _timer;

  @override
  void initState() {
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
    _moodState.noteController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _moodState.noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // tab
              const SizedBox(height: 10),
              TabSwitch(
                onTap: () {
                  setState(() {
                    _selectedTab = !_selectedTab;
                  });
                },
                selectedTab: _selectedTab,
              ),
              const SizedBox(height: 30),
              _selectedTab ? _buildDiary(context) : const InDevelopment()
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      title: Text(
        "${DateTime.timestamp().day} ${_moodState.getMonth(_currentTime.month)} ${_currentTime.hour.toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}",
        style: const TextStyle(
          color: AppColors.grayColor,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CalendarPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.calendar_month,
            color: AppColors.grayColor,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
      centerTitle: true,
    );
  }

  Column _buildDiary(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // moods
        const Text(
          'Что чувствуешь?',
          style: AppTextStyles.headerStyle,
        ),
        _buildMoods(),
        const SizedBox(height: 10),

        // feelings
        _moodState.selectedMood.isEmpty ? const SizedBox() : _buildFeelings(),
        const SizedBox(height: 10),

        // slider: stress level
        const Text(
          'Уровень стресса',
          style: AppTextStyles.headerStyle,
        ),
        SliderBox(
          textOne: 'Низкий',
          textTwo: 'Высокий',
          sliderValue: _moodState.valueStress,
          onChanged: (value) {
            setState(() {
              _moodState.valueStress = value;
            });
          },
        ),

        // slider: self esteem
        const Text(
          'Самооценка',
          style: AppTextStyles.headerStyle,
        ),
        SliderBox(
          textOne: "Неуверенность",
          textTwo: "Уверенность",
          sliderValue: _moodState.valueSelf,
          onChanged: (value) {
            setState(() {
              _moodState.valueSelf = value;
            });
          },
        ),

        // notes
        const Text(
          'Заметки',
          style: AppTextStyles.headerStyle,
        ),
        NotesWidget(
          controller: _moodState.noteController,
          hintText: "Введите заметку",
        ),

        // save btn
        CustomButton(
          text: "Сохранить",
          textColor: isFilled() ? Colors.white : const Color(0xffBCBCBF),
          btnColor: isFilled()
              ? AppColors.mandarinColor
              : const Color.fromARGB(255, 225, 225, 225),
          onTap: () {
            isFilled() ? popUpShow(context) : null;
          },
        ),
      ],
    );
  }

  SizedBox _buildMoods() {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return MoodWidget(
            selectedMood: _moodState.selectedMood,
            title: _moodState.emotionsList[index],
            imagePath: _moodState.imagePath[index],
            onTap: () {
              setState(() {
                _moodState.selectedMood = _moodState.imagePath[index];
              });
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 20);
        },
        itemCount: _moodState.emotionsList.length,
      ),
    );
  }

  Wrap _buildFeelings() {
    return Wrap(
      children: List.generate(_moodState.feelingsList.length, (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _moodState.selectedFeelings == _moodState.feelingsList[index]
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
            onTap: () {
              setState(() {
                _moodState.selectedFeelings = _moodState.feelingsList[index];
              });
            },
            child: Text(
              _moodState.feelingsList[index],
              style: TextStyle(
                fontSize: 16,
                color: _moodState.selectedFeelings ==
                        _moodState.feelingsList[index]
                    ? Colors.white
                    : AppColors.fontColor,
              ),
            ),
          ),
        );
      }),
    );
  }

  popUpShow(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomPopUp(
          popUpTitle: "Данные успешно сохранены!",
          btnText: "Ок",
          onTap: () {
            Navigator.pop(context);
            setState(() {
              _moodState.clearData();
            });
          },
        );
      },
    );
  }

  bool isFilled() {
    if (_moodState.valueSelf > 0.0 &&
        _moodState.valueStress > 0.0 &&
        _moodState.noteController.text.isNotEmpty &&
        _moodState.selectedMood.isNotEmpty &&
        _moodState.selectedFeelings.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
