import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuiz});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        // Column => mainAxisSize and children.
        mainAxisSize: MainAxisSize.min,
        children: [
          // Children takes list of widgets.

          Image.asset('assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(
                  150, 255, 255, 255)), // For transparency, use lighter colors.
          // Alternate way.
          // Opacity(
          //     opacity: 0.6,
          //     child: Image.asset('assets/images/quiz-logo.png', width: 300)),

          const SizedBox(height: 80),

          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
          ),

          const SizedBox(height: 30),

          OutlinedButton.icon(
            // OutlinedButton() => onPressed, style, child.
            onPressed: startQuiz, // OutlinedButton.icon() => child -> label.
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
