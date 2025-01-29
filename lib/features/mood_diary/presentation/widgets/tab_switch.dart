import 'package:evo_mobile_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabSwitch extends StatelessWidget {
  TabSwitch({super.key, required this.onTap, required this.selectedTab});
  void Function()? onTap;
  final bool selectedTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 227, 227, 227),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                alignment: Alignment.center,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: selectedTab ? AppColors.mandarinColor : null,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        width: 15,
                        "assets/icons/diary_${selectedTab ? "sel" : "dis"}.svg"),
                    Text(
                      " Дневник настроения",
                      style: TextStyle(
                        color: selectedTab ? Colors.white : AppColors.grayColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                alignment: Alignment.center,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: selectedTab ? null : AppColors.mandarinColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      width: 15,
                      "assets/icons/stats_${selectedTab ? "dis" : "sel"}.svg",
                    ),
                    Text(
                      " Статистика",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: selectedTab ? AppColors.grayColor : Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
