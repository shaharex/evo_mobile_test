import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class SliderBox extends StatelessWidget {
  const SliderBox({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.sliderValue,
    this.onChanged,
  });

  final String textOne;
  final String textTwo;
  final double sliderValue;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 30),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 249, 249, 249),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: const Color(0xffB6A1C0).withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(2, 4))
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                (index) {
                  return Container(
                    height: 13,
                    width: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: const Color(0xffE1DDD8),
                    ),
                  );
                },
              ),
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.mandarinColor,
              inactiveTrackColor: const Color(0xffE1DDD8),
              thumbColor: sliderValue == 0.0
                  ? const Color(0xffE1DDD8)
                  : AppColors.mandarinColor,
              overlayColor: AppColors.mandarinColor.withOpacity(0.1),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 18),
              trackHeight: 6,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 10,
                elevation: 0.2,
              ),
            ),
            child: Slider(
              value: sliderValue,
              onChanged: onChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textOne,
                  style: const TextStyle(
                    color: Color(0xff919EAB),
                    fontSize: 14,
                  ),
                ),
                Text(
                  textTwo,
                  style: const TextStyle(
                    color: Color(0xff919EAB),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
