import 'package:flutter/material.dart';
import 'package:quiz_juman/ui/home/quiz/quiz_questions.dart';

import '../../../config/empty_state.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Ready to test your knoweldge and challenge others?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
          ),
          const EmptyStateSvg(
            image: 'assets/images/splash_screen.svg',
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text(
              'Quiz Me',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(QuizQuestion.routeName);
            },
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Answer as much question correclty within 2 minutes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
