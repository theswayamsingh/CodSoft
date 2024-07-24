// build() is called when constructor function is called and when setState() is called.

import 'package:flutter/material.dart';
import 'package:quiz_app/options_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'globals.dart' as globals;

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
  void switchToQuesScreen() {
    setState(() {
      // Method A.
      // activeScreen = const QuestionsScreen();

      // Alternate Method B.
      activeScreen = 'questions-screen';
    });
  }

  void switchToOptionsScreen() {
    setState(() {
      // Method A.
      // activeScreen = const QuestionsScreen();

      // Alternate Method B.
      activeScreen = 'options-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == globals.questions[globals.index!].length) {      // questions.dart
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void switchToHome() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'home-screen';
    });
  }

  @override
  Widget build(context) {
    // build() - Executed by Flutter when the Widget is built for the first time AND after setState() was called.

    Widget screenWidget = StartScreen(start: switchToOptionsScreen); ;      //start_screen.dart
    if (activeScreen == 'home-screen') {
      screenWidget = StartScreen(start: switchToOptionsScreen);       //questions_screen.dart
    }
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer:  chooseAnswer);      //questions_screen.dart
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers, home: switchToHome,);      //result_screen.dart
    }
    if (activeScreen == 'options-screen') {
      screenWidget = OptionsScreen(startQuiz: switchToQuesScreen);      //result_screen.dart
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                  Color.fromARGB(255, 135, 167, 255),
                  Color.fromARGB(255, 148, 153, 255),],
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
