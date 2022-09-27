import 'package:flutter/material.dart';
import 'package:quiz_juman/ui/home/quiz/quiz_questions.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: const Text('Quiz Me'),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(QuizQuestion.routeName);
          },
        )
      ],
    );
  }
}
