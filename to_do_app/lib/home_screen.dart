import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/items_list.dart';
import 'package:to_do_app/task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeScreen = 'items-list';
  Widget? screenWidget;

  void switchToTaskWindow(){
    setState(() {
      activeScreen = 'task-screen';
    });
  }

  void switchToItemsList(){
    setState(() {
      activeScreen = 'items-list';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (activeScreen == 'task-screen'){
      screenWidget = TaskScreen(gotoItemsList: switchToItemsList,);
    }

    if (activeScreen == 'items-list'){
      screenWidget = ItemsList(gotoTaskWindow: switchToTaskWindow);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 135, 167, 255),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            title: Text(
              'To Do App',
              style: GoogleFonts.karla(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30),),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 106, 95, 255),
                  Color.fromARGB(255, 160, 219, 255),
                ],
              )
            ),
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}