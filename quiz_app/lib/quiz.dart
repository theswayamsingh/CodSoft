// build() is called when constructor function is called and when setState() is called.

import 'package:flutter/material.dart';
import 'package:secondapp/questions_screen.dart';
import 'package:secondapp/start_screen.dart';
import 'package:secondapp/data/questions.dart';
import 'package:secondapp/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  // Quiz is parent class.

  // Mrthod A.
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   //  initState() - Executed(only once) by Flutter when the StatefulWidget's State object is initialized.
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState(); // initState executes in parent class too
  // }

  // Alternate Method B.
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      // Method A.
      // activeScreen = const QuestionsScreen();

      // Alternate Method B.
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {      // questions.dart
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    // build() - Executed by Flutter when the Widget is built for the first time AND after setState() was called.

    Widget screenWidget = StartScreen(startQuiz: switchScreen);      //start_screen.dart
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer:  chooseAnswer);      //questions_screen.dart
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz,);      //result_screen.dart
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 68, 255, 199)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Method A.
          //child: activeScreen,
          // Alternate Method B.
          child: screenWidget,
        ),
      ),
    );
  }
}
