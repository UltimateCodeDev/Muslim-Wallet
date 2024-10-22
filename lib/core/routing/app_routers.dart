import 'package:flutter/material.dart';
import 'package:muslim_wallet/core/routing/routers.dart';

import '../../features/onboarding/pre/view/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),);

      default:return MaterialPageRoute(
          builder: (_)=> Scaffold(
            body: Center(
              child: Text(' No route defind for ${settings.name}'),
            ),
          ));
    }
  }
}
