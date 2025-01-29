import 'package:evo_mobile_test/core/core.dart';
import 'package:flutter/material.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget(
      {super.key, required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 30),
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(10),
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
      child: TextField(
        controller: controller,
        expands: true,
        maxLines: null,
        minLines: null,
        cursorColor: AppColors.mandarinColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xffBCBCBF),
          ),
        ),
      ),
    );
  }
}
