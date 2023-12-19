import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answer, this.onTap, {super.key});

  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        fixedSize: const Size.fromWidth(400),
        textStyle: const TextStyle(
          fontSize: 18,
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 86, 5, 93),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        side: const BorderSide(
            width: 2,
            color: Color.fromARGB(255, 165, 11, 171),
            strokeAlign: BorderSide.strokeAlignOutside),
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
