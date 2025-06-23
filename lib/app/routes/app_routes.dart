import 'package:get/get.dart';
import '../../features/auth/views/login_screen.dart';
import '../../features/home/views/home_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String initial = login;

  static List<GetPage> get routes => [
        GetPage(
          name: login,
          page: () => const LoginScreen(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: home,
          page: () => const HomeScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 300),
        ),
      ];
}
