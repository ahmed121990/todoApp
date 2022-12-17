import 'package:flutter/material.dart';
import 'package:todoapp/Home/Add_Task.dart';
import 'package:todoapp/Home/List/list.dart';
import 'package:todoapp/Home/Settings/Seetings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_secreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selctedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
        onPressed: () {
          showAddTaskBottom();
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selctedindex,
          onTap: (index) {
            selctedindex = index;
            setState(() {
              selctedindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
        ),
      ),
      body: tabs[selctedindex],
    );
  }

  var tabs = [ListScreen(), SettingsScreen()];

  void showAddTaskBottom() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return AddTask();
        });
  }
}
