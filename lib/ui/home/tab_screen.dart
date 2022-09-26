import 'package:flutter/material.dart';
import 'package:quiz_juman/ui/home/profile/profile_screen.dart';
import 'package:quiz_juman/ui/home/quiz/quiz_screen.dart';

import 'leaderboard/leaderboard_screen.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tab-screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectPageIndex = 0;
  final List<Widget> _pages = [
    QuizScreen(),
    LeaderboardScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizU'),
      ),
      bottomNavigationBar: menu(),
      body: Container(
        child: _pages[_selectPageIndex],
      ),
    );
  }

  void _selectPage(int index) async {
    setState(() {
      _selectPageIndex = index;
    });
  }

  Widget menu() {
    return SafeArea(
      bottom: false,
      child: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
          elevation: 2,
          selectedFontSize: 0,
          onTap: _selectPage,

          /// backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.purpleAccent[300],
          currentIndex: _selectPageIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.thirty_fps_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
