import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:foodstuff/src/data/food.dart';
import 'package:foodstuff/src/ui/form_food_page.dart';
import 'package:foodstuff/src/widget/card_food.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = "/dashboard";

  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 8.0,
              ),
              child: Text(
                "Find and Add \n\tYour Best Recipe",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 32.0,
                  right: 16.0,
                  bottom: 16.0,
                ),
                child: GridView.builder(
                  itemCount: dummyData.length,
                  itemBuilder: (context, index) {
                    return CardFood(
                      food: dummyData[index],
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            FormFoodPage.routeName,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
