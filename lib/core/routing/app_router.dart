import 'package:go_router/go_router.dart';
import 'package:tadweer/core/routing/routes.dart';
import 'package:tadweer/features/onboarding/presentation/screens/on_boarding_screen.dart';

abstract class AppRouter {
  static late final GoRouter router;

  static void initRouter() {
    router = GoRouter(
      initialLocation: Routes.onboarding,
      routes: [
        GoRoute(
          path: Routes.onboarding,
          builder: (context, state) => const OnBoardingScreen(),
        ),
      ],
    );
  }
}
