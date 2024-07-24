import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart' as globals;

class OptionsScreen extends StatelessWidget {
  OptionsScreen({super.key, required this.startQuiz});
  final void Function() startQuiz;

  final options = ['C Language', 'Python', 'Flutter', 'Start Random Quiz'];

  onClick(index){
    if (index!=3){
      globals.index = index;
    } else {
      Random random = Random();
      globals.index = random.nextInt(3);
    }
    startQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
              Color.fromARGB(255, 135, 167, 255),
              Color.fromARGB(255, 148, 153, 255),],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return OutlinedButton(
              onPressed:(){
                onClick(index);
              },
              child: Center(child: Text(options[index], style: GoogleFonts.lato(fontSize: 20, color: Colors.white),)),
            );
          },
        ),
      ),
    );
  }
}