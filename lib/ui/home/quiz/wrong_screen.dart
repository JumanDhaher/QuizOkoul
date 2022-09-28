import 'package:flutter/material.dart';
import 'package:quiz_juman/ui/home/quiz/quiz_questions.dart';

import '../tab_screen.dart';

class WrongScreen extends StatelessWidget {
  static const routeName = '/Wrong-screen';

  const WrongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 32,
          ),
          onPressed: () => Navigator.of(context).pushNamed(TabScreen.routeName),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '😢',
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Wrong Answer',
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text('Try Again'),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(QuizQuestion.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
