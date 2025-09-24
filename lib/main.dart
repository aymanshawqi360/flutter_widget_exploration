import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_exploration/core/routes/app_routing.dart';
import 'package:flutter_widget_exploration/core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyProjects(appRoutingl: AppRouting()));
}

class MyProjects extends StatelessWidget {
  final AppRouting appRoutingl;
  const MyProjects({super.key, required this.appRoutingl});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.miniApp,
      onGenerateRoute: appRoutingl.onGenerateRoute,
    );
  }
}
