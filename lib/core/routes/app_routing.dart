import 'package:flutter/material.dart';
import 'package:flutter_widget_exploration/core/routes/routes.dart';
import 'package:flutter_widget_exploration/features/Interactive_dismissible_lists/page/Interactive_dismissible_lists.dart';
import 'package:flutter_widget_exploration/features/advanced_animation_chain/page/advanced_animation_chain.dart';
import 'package:flutter_widget_exploration/features/interactive_physics_widget/page/interactive_physics_widget.dart';
import 'package:flutter_widget_exploration/features/mini_app_widget/page/mini_app.dart';

class AppRouting {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.interactiveDismissibleLists:
        return MaterialPageRoute(builder: (_) => InteractiveDismissibleLists());
      case Routes.interactivePhysicsWidget:
        return MaterialPageRoute(builder: (_) => InteractivePhysicsWidget());
      case Routes.advancedAnimationChain:
        return MaterialPageRoute(builder: (_) => AdvancedAnimationChain());
      case Routes.miniApp:
        return MaterialPageRoute(builder: (_) => MiniApp());

      default:
        return defaultPage();
    }
  }

  MaterialPageRoute<dynamic> defaultPage() =>
      MaterialPageRoute(builder: (_) => Scaffold(body: Text("data")));
}
