import 'package:flutter/material.dart';
import 'package:rickandmorty_app/core/di/dependency_injection.dart';
import 'package:rickandmorty_app/core/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // DI
  setupDependencyInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rick And Morty',
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
    );
  }
}
