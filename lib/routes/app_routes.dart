import 'package:get/get.dart';
import 'package:job_tracker/screens/home/home_screen.dart';
import 'package:job_tracker/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String main = '/home';
  static const String login = '/login';

  static final routes = [
    GetPage(
        name: splash,
        page: () => SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(name: main, page: () => HomeScreen()),
  ];
}
