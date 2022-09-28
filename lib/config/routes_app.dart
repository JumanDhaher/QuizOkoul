import 'package:quiz_juman/ui/auth/login.dart';
import 'package:quiz_juman/ui/auth/name.dart';
import 'package:quiz_juman/ui/auth/otp_auth.dart';
import 'package:quiz_juman/ui/home/quiz/correct_screen.dart';
import 'package:quiz_juman/ui/home/quiz/quiz_questions.dart';
import 'package:quiz_juman/ui/home/quiz/wrong_screen.dart';
import 'package:quiz_juman/ui/home/tab_screen.dart';

import '../ui/splash_screen/splash_screen.dart';

class RoutesApp {
  static routesApp() {
    return {
      '/': (ctx) => const SplashScreens(),
      OtpScreen.routeName: (ctx) => const OtpScreen(),
      NameScreen.routeName: (ctx) => NameScreen(),
      TabScreen.routeName: (ctx) => const TabScreen(),
      Login.routeName: (ctx) => const Login(),
      QuizQuestion.routeName: (ctx) => const QuizQuestion(),
      CorrectAnswer.routeName: (ctx) => const CorrectAnswer(),
      WrongScreen.routeName: (ctx) => const WrongScreen()
    };
  }
}
