import 'package:flutter/material.dart';
import 'package:quiz_juman/ui/home/profile/profile_screen.dart';
import 'package:quiz_juman/ui/home/quiz/quiz_screen.dart';
import 'package:heroicons/heroicons.dart';

import '../../config/user_preferences.dart';
import '../auth/login.dart';
import 'leaderboard/leaderboard_screen.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tab-screen';

  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectPageIndex = 0;
  final List<Widget> _pages = [
    QuizScreen(),
    const LeaderboardScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizU'),
        automaticallyImplyLeading: false,
        actions: _selectPageIndex != 2
            ? null
            : [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    UserPreferences().removeUser();

                    Navigator.of(context).pushNamed(Login.routeName);
                  },
                ),
              ],
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
          selectedItemColor: const Color(0xFF6C63FF),
          currentIndex: _selectPageIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: HeroIcon(
                HeroIcons.home,
                size: 24,
                solid: true,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: HeroIcon(
                HeroIcons.trophy,
                size: 24,
                solid: true,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 24,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
