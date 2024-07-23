import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'globals.dart' as globals;

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key, required this.gotoItemsList});
  final void Function() gotoItemsList;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  onSave() async {
    if (globals.title.text!=''){
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'dataBase.db');
      Database dataBase = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE data (title TEXT PRIMARY KEY, description TEXT, completed TEXT)'
          );
        },
      );
      // await deleteDatabase(path);
      List<Map> list = await dataBase.rawQuery('SELECT * FROM data');
      if (globals.itemIndex==-1){
        await dataBase.rawInsert('INSERT INTO data(title, description, completed) VALUES("${globals.title.text}", "${globals.description.text}", "false")');
      } else {
        await dataBase.rawUpdate('UPDATE data SET title = "${globals.title.text}", description = "${globals.description.text}" WHERE title="${list[globals.itemIndex!]['title']}"');
      }
      dataBase.close();
      widget.gotoItemsList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 600,
            width: 500,
            decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  const Text(
                    'Task',
                     style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                     ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: 400,
                    height: 50,
                    padding: const EdgeInsets.all(.8), // Padding for internal items.
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 49, 104, 255),),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: TextField(
                      controller: globals.title,
                      maxLines: 1,
                      // controller: commentsController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    width: 400,
                    height: 400,
                    padding: const EdgeInsets.all(.8), // Padding for internal items.
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 49, 104, 255),),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: TextField(
                      controller: globals.description,
                      keyboardType: TextInputType.multiline,
                      maxLines: 7,
                      // controller: commentsController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Description",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 160, 219, 255),
                            Color.fromARGB(255, 106, 95, 255),
                          ],),),
                      child: TextButton(
                        onPressed: onSave,
                        child: const Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: widget.gotoItemsList,
              icon: const Icon(Icons.close_rounded, size: 40,)
            ),
          ],
        )
      ],
    );
  }
}