import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart' as globals;

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers, required this.home});

  final void Function() home;
  final List<String> chosenAnswers;

  // Map is same as Dictionary in python.
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': globals.questions[globals.index!][i].text,       // questions.dart
        'correct_answer': globals.questions[globals.index!][i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = globals.questions[globals.index!].length;
    final numCorrectQuestions = summaryData.where((data) {
      // if false than data is dropped and in the end new list is formed.
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),      // questions_summary.dart
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: home,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.home, size: 28,),
              label: const Text('Home', style: TextStyle(fontSize: 24),),
            )
          ],
        ),
      ),
    );
  }
}
