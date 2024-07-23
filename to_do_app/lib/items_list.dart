import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'globals.dart' as globals;

class ItemsList extends StatefulWidget {
  const ItemsList({super.key, required this.gotoTaskWindow});
  final void Function() gotoTaskWindow;

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {

  int itemsCount = 0;
  var itemsList;
  loadData() async {
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
    List<Map> list = await dataBase.rawQuery('SELECT * FROM data');
    itemsCount = list.length;
    dataBase.close();
    return list;
  }

  itemColor(index){
    if (itemsList[index]['completed']=="false"){
      return  const Color.fromARGB(255, 165, 169, 255);
    }
    else {
      return const Color.fromARGB(255, 109, 255, 165);
    }
  }

  Widget buildItem(index){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
          color: itemColor(index)
        ),
        child: ListTile(
          leading: IconButton(
            onPressed: () async {
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
              if (itemsList[index]['completed']=="false"){
                await dataBase.rawUpdate('UPDATE data SET completed = "true" WHERE title="${itemsList[index]['title']}"');
              } else {
                await dataBase.rawUpdate('UPDATE data SET completed = "false" WHERE title="${itemsList[index]['title']}"');
              }
              setState(() {});
            },
            icon: const Icon(Icons.check, size: 30,),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              SizedBox(
                width:210,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    itemsList[index]['title'],
                    style: GoogleFonts.karla(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: (){
                  edit(index);
                },
                icon: const Icon(Icons.edit, size: 30,),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                deleteTask(index);
              });
            },
            icon: Image.asset(
              'assets/images/recycle-bin.png',
              width: 30,
            ),
          ),
        ),
      ),
    );
  }

  void newTask() {
    globals.description.text = '';
    globals.title.text='';
    globals.itemIndex = -1;
    widget.gotoTaskWindow();
  }

  void edit(int index) async {
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
    List<Map> list = await dataBase.rawQuery('SELECT * FROM data');
    dataBase.close();
    globals.title.text = list[index]['title'];
    globals.description.text = list[index]['description'];
    globals.itemIndex = index;
    widget.gotoTaskWindow();
  }

  void deleteTask(int index) async {
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
    await dataBase.rawDelete('DELETE FROM data WHERE title="${itemsList[index]['title']}"');
    dataBase.close();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 135, 167, 255),
                  Color.fromARGB(255, 165, 169, 255),
                ]
              )
            ),
            child: TextButton(
              onPressed:newTask,
              child: Text(
                'New Task +',
                style: GoogleFonts.karla(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 780,
          child: FutureBuilder(
            future: loadData(),
            builder: (context, snapshot) {
              if (snapshot.hasData==false){
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );}
              itemsList = snapshot.data;
              return ListView.builder(
              itemBuilder: (context, index){
                return buildItem(index);
              },
              itemCount: itemsCount,
              );
            },
          ),
        ),
      ],
    );
  }
}