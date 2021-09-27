import 'package:flutter/material.dart';
import 'package:foodstuff/src/common/style.dart';
import 'package:foodstuff/src/ui/boarding_page.dart';
import 'package:foodstuff/src/ui/dashboard_page.dart';
import 'package:foodstuff/src/ui/form_food_page.dart';
import 'package:foodstuff/src/ui/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: myTextTheme,
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          BoardingPage.routename: (context) => BoardingPage(),
          DashboardPage.routeName: (context) => DashboardPage(),
          FormFoodPage.routeName: (context) => FormFoodPage(),
        });
  }
}
