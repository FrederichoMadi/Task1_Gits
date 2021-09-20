import 'package:flutter/material.dart';
import 'package:task_basic_widget/model/user.dart';
import 'package:task_basic_widget/ui/biografi/biografi_page.dart';
import 'package:task_basic_widget/ui/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.black),
          scaffoldBackgroundColor: Colors.black,
          brightness: Brightness.dark),
      // initialRoute: MyHomePage.routeName,
      // routes: {
      //   MyHomePage.routeName: (context) => MyHomePage(),
      //   BiografiPage.routeName: (context) => BiografiPage(
      //       user: ModalRoute.of(context)?.settings.arguments as User)
      // },
      home: MyHomePage(),
    );
  }
}
