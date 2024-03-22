import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.appLayout:
        return MaterialPageRoute(
          builder: (context) => const AppLayout(),
        );
      case Routes.recipeDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => RecipeDetailsScreen(
            data: args as Data,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Page Not Found"),
            ),
          ),
        );
    }
  }
}