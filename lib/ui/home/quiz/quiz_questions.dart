import 'package:flutter/material.dart';
import 'package:quiz_juman/ui/home/quiz/correct_screen.dart';
import 'package:quiz_juman/ui/home/quiz/wrong_screen.dart';
import 'package:quiz_juman/ui/home/tab_screen.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:quiz_juman/api/question_api.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../api/score_api.dart';

class QuizQuestion extends StatefulWidget {
  static const routeName = '/QuizQuestion-screen';
  static int score = 0;

  const QuizQuestion({super.key});

  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  late Future<List<dynamic>> future;
  late PageController _controller;
  late Box<Map<dynamic, dynamic>> scoreBox;
  late bool countDownFinished;
  late CountdownController countdownController;

  bool first = true;

  @override
  void initState() {
    super.initState();
    scoreBox = Hive.box("score");

    QuizQuestion.score = 0;
    _controller = PageController(initialPage: 0);

    countDownFinished = false;
    countdownController = CountdownController(autoStart: true);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (first) {
      future = QuestionApi().getQuestions();
      first = false;
    }
    if (countDownFinished) {
      _goToCorrectAnswer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  var pressNotSkip = true;

  String pressedAns = '';
  int questionNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () async {
          await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Do you want to go back?'),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(TabScreen.routeName);
                      countDownFinished = false;
                      countdownController.pause();
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('No'),
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(Icons.close),
      )),
      body: FutureBuilder<List<dynamic>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    Countdown(
                      controller: countdownController,
                      onFinished: () {
                        setState(() {
                          countDownFinished = true;
                        });
                        if (countDownFinished && QuizQuestion.score != 0) {
                          _goToCorrectAnswer();
                          countDownFinished = false;
                          countdownController.pause();
                        } else {
                          _goToWrongPage();
                          countDownFinished = false;
                          countdownController.pause();
                        }
                      },
                      seconds: 120,
                      build: (BuildContext context, double time) {
                        var minutes = (time ~/ 60);
                        var seconds = (time % 60).toInt() >= 10
                            ? (time % 60).toInt()
                            : "0${(time % 60).toInt()}";
                        return Text(
                          "$minutes:$seconds",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: PageView.builder(
                          controller: _controller,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: Text(
                                    snapshot.data![i]['Question']!,
                                    style: const TextStyle(
                                      fontSize: 30,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      key: const Key('a'),
                                      style: ButtonStyle(
                                          backgroundColor: pressedAns == ''
                                              ? MaterialStateProperty.all(
                                                  Colors.grey)
                                              : snapshot.data![i]['correct'] ==
                                                      'a'
                                                  ? MaterialStateProperty.all(
                                                      Colors.green)
                                                  : MaterialStateProperty.all(
                                                      Colors.red)),
                                      onPressed: pressedAns != ''
                                          ? null
                                          : () {
                                              setState(() {
                                                pressedAns = 'a';
                                              });
                                              _pressAction(snapshot, i);
                                            },
                                      child:
                                          Text('a: ${snapshot.data![i]['a']!}'),
                                    ),
                                    ElevatedButton(
                                      key: const Key('b'),
                                      style: ButtonStyle(
                                          backgroundColor: pressedAns == ''
                                              ? MaterialStateProperty.all(
                                                  Colors.grey)
                                              : snapshot.data![i]['correct'] ==
                                                      'b'
                                                  ? MaterialStateProperty.all(
                                                      Colors.green)
                                                  : MaterialStateProperty.all(
                                                      Colors.red)),
                                      onPressed: pressedAns != ''
                                          ? null
                                          : () {
                                              setState(() {
                                                pressedAns = 'b';
                                              });
                                              _pressAction(snapshot, i);
                                            },
                                      child:
                                          Text('b: ${snapshot.data![i]['b']!}'),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      key: const Key('c'),
                                      style: ButtonStyle(
                                          backgroundColor: pressedAns == ''
                                              ? MaterialStateProperty.all(
                                                  Colors.grey)
                                              : snapshot.data![i]['correct'] ==
                                                      'c'
                                                  ? MaterialStateProperty.all(
                                                      Colors.green)
                                                  : MaterialStateProperty.all(
                                                      Colors.red)),
                                      onPressed: pressedAns != ''
                                          ? null
                                          : () {
                                              setState(() {
                                                pressedAns = 'c';
                                              });

                                              _pressAction(snapshot, i);
                                            },
                                      child:
                                          Text('c: ${snapshot.data![i]['c']!}'),
                                    ),
                                    ElevatedButton(
                                      key: const Key('d'),
                                      style: ButtonStyle(
                                          backgroundColor: pressedAns == ''
                                              ? MaterialStateProperty.all(
                                                  Colors.grey)
                                              : snapshot.data![i]['correct'] ==
                                                      'd'
                                                  ? MaterialStateProperty.all(
                                                      Colors.green)
                                                  : MaterialStateProperty.all(
                                                      Colors.red)),
                                      onPressed: pressedAns != ''
                                          ? null
                                          : () {
                                              setState(() {
                                                pressedAns = 'd';
                                              });
                                              _pressAction(snapshot, i);
                                            },
                                      child:
                                          Text('d: ${snapshot.data![i]['d']!}'),
                                    ),
                                  ],
                                ),
                                if (pressedAns != '')
                                  Center(
                                    child: Text(
                                        'correct is: ${snapshot.data![i]['correct']!},'),
                                  ),
                                const SizedBox(
                                  height: 20,
                                ),
                                if (pressNotSkip)
                                  ElevatedButton(
                                      onPressed: () {
                                        if (pressNotSkip) {
                                          setState(() {
                                            pressNotSkip = false;
                                          });
                                        }
                                      },
                                      child: const Text('Skip'))
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              );
            } else {
              // print(snapshot.error);
            }
            return Container();
          }),
    );
  }

  _pressAction(snapshot, int i) {
    if (pressedAns != snapshot.data![i]['correct']) {
      _goToWrongPage();
    }
    if (questionNumber < snapshot.data!.length) {
      _controller.nextPage(
          curve: Curves.easeInExpo,
          duration: const Duration(microseconds: 250));
      if (pressedAns == snapshot.data![i]['correct']) {
        setState(() {
          QuizQuestion.score++;
        });
      }
      setState(() {
        questionNumber++;
        pressedAns = '';
      });
    } else {
      _goToCorrectAnswer();
    }
  }

  void _goToWrongPage() {
    countDownFinished = false;
    countdownController.pause();
    Navigator.of(context).pushNamed(
      WrongScreen.routeName,
    );
  }

  void _goToCorrectAnswer() {
    countDownFinished = false;
    countdownController.pause();
    ScoreApi().postScore(QuizQuestion.score.toString()).then((value) {
      //print(value);
    });
    saveScorefunction();

    Navigator.of(context).pushReplacementNamed(
      CorrectAnswer.routeName,
    );
    // print(QuizQuestion.score.toString());
  }

  void saveScorefunction() {
    scoreBox.add({'score': QuizQuestion.score, 'date': DateTime.now()});
  }
}
