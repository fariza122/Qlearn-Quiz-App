import 'package:get/get.dart';
import 'package:learning_app/controllers/question_paper/q_paper_controller.dart';
import 'package:learning_app/controllers/question_screen_controller.dart';
import 'package:learning_app/controllers/zoom_drawer_controller.dart';
import 'package:learning_app/screens/home/home_screen.dart';
import 'package:learning_app/screens/intro/introduction.dart';
import 'package:learning_app/screens/login/login_screen.dart';
import 'package:learning_app/screens/questions/correct_ans_screen.dart';
import 'package:learning_app/screens/questions/questions_screen.dart';
import 'package:learning_app/screens/questions/quiz_overview_screen.dart';
import 'package:learning_app/screens/questions/result_screen.dart';
import 'package:learning_app/screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
            name: "/",
            page: () => const SplashScreen(),
            transition: Transition.zoom),
        GetPage(
            name: "/intro_screen",
            page: () => const IntroScreen(),
            transition: Transition.zoom),
        GetPage(
          name: "/home_screen",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(QPaperController());
            Get.put(ZoomDController());
          }),
          // transition: Transition.rightToLeft
        ),
        GetPage(
            name: LoginScreen.routeName,
            page: () => const LoginScreen(),
            transition: Transition.zoom),
        GetPage(
            name: QuestionsScreen.routeName,
            page: () => const QuestionsScreen(),
            binding: BindingsBuilder(() {
              Get.put<QScreenController>(QScreenController());
            }),
            transition: Transition.zoom),
        GetPage(
            name: QuizOverviewScreen.routeName,
            page: () => const QuizOverviewScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: ResultScreen.routeName,
            page: () => const ResultScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: CorrectAnsScreen.routeName,
            page: () => const CorrectAnsScreen(),
            transition: Transition.zoom)
      ];
}
