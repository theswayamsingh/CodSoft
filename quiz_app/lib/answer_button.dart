import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  
  final String answerText;
  final void Function() onTap;
  const AnswerButton(this.answerText, this.onTap, {super.key});

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: Colors.white70,
        foregroundColor: Color.fromARGB(255, 95, 26, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
      ),
      child: Text(answerText, style: const TextStyle(fontSize: 14), textAlign: TextAlign.center,),
    );
  }
}
