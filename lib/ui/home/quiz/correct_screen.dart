import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:quiz_juman/ui/home/quiz/quiz_questions.dart';
import 'package:quiz_juman/ui/home/tab_screen.dart';

class CorrectAnswer extends StatefulWidget {
  static const routeName = '/CorrectAnswer-screen';

  @override
  State<CorrectAnswer> createState() => _CorrectAnswerState();
}

class _CorrectAnswerState extends State<CorrectAnswer> {
  String score = '';

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    score = QuizQuestion.score.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 32,
          ),
          onPressed: () {
            QuizQuestion.score = 0;
            Navigator.of(context).pushNamed(TabScreen.routeName);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '🏁',
              style: TextStyle(fontSize: 50),
            ),
            const Text(
              'You have completed',
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
            if (score != '')
              Text(
                score,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
            const Text(
              'correct answer! ',
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.share,
                size: 40,
              ),
              label: const Text(
                'Share',
                style: TextStyle(fontSize: 40),
              ),
              onPressed: () => share(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Correct Answers',
        text:
            'I answered $score correct answers in QuizU!” (where $score is the number of correct answers)',
        chooserTitle: 'QuizU');
  }
}
