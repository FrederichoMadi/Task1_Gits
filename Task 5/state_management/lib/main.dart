import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/data_provider.dart';
import 'package:state_management/ui/add_update_page.dart';
import 'package:state_management/ui/home_page.dart';

import 'model/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        title: "State Management",
        theme: ThemeData(brightness: Brightness.dark),
        home: HomePage(),
      ),
    );
  }
}
