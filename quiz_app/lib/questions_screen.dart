// flutter pub add google_fonts (run in terminal)

import 'package:flutter/material.dart';
import 'package:secondapp/answer_button.dart';
import 'package:secondapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(
        selectedAnswer); // widget. used to access elements of state class.
    setState(() {
      // Calls build() again.
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, // Take space as much as possible.
      child: Container(
        margin: const EdgeInsets.all(20), // Edge margins.
        child: Column(
          // In column, main axis is vertical, and cross axis is horizontal.
          mainAxisAlignment: MainAxisAlignment.center, // by default, top.
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // stretch as much it can.
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.deepPurple,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Centre Alignment.
            ),
            const SizedBox(height: 30),

            // Method 1 : (no. of buttons = no. of answers)
            // ... pulls out list values and convert them into comma separated values.
            ...currentQuestion.getShuffledAnswers().map((answer) {     //quiz_question.dart
              // If ... not used, Error because children only takes widgets with commas not list.
              return AnswerButton(answer, () {
                answerQuestion(answer);      // (){} is used because button takes functions without input.
              });
            }) // .map() used to convert values of list to other values. (){} is applied to each value in the list. (Old list is not affected)

            // Method 2 : (no. of buttons = 4)
            // AnswerButton(currentQuestion.answers[0], () {}),
            // AnswerButton(currentQuestion.answers[1], () {}),
            // AnswerButton(currentQuestion.answers[2], () {}),
            // AnswerButton(currentQuestion.answers[3], () {}),
          ],  
        ),
      ),
    );
  }
}
