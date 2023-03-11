import 'package:flutter/material.dart';
import 'package:flutter_application_1/App/App.locator.dart';
import 'package:flutter_application_1/App/App.router.dart';
import 'package:flutter_application_1/utills/Colors.dart';
import 'package:stacked_services/stacked_services.dart';


void main() async {
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteColor,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

