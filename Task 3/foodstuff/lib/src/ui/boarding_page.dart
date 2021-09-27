import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:foodstuff/src/ui/dashboard_page.dart';

class BoardingPage extends StatefulWidget {
  static const routename = "/boarding";

  @override
  _BoardingPageState createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  int index = 0;

  List<String> title = ["Find Your Favorite Food", "Healthy Food"];

  List<String> description = [
    "Find the best recipes to practice cooking and improve your skills",
    "Choose healthy foods that are good for health and immunity",
  ];

  List<String> image = [
    'assets/onboarding_1.jpg',
    'assets/onboarding_2.jpg',
  ];

  //get title
  String getTitle(int index) {
    if (index == 0) {
      return title[0];
    } else {
      return title[1];
    }
  }

  String getDescription(int index) {
    if (index == 0) {
      return description[0];
    } else {
      return description[1];
    }
  }

  String getImage(int index) {
    if (index == 0) {
      return image[0];
    } else {
      return image[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              getImage(index),
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.black12],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      FloatingActionButton(
                        mini: true,
                        backgroundColor: Colors.white10.withOpacity(0.4),
                        onPressed: () {
                          setState(() {
                            if (index > 0) {
                              index--;
                            } else {
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 42.0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        getTitle(index),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        getDescription(index),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 20),
                      RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            if (index < 1) {
                              index++;
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardPage()));
                            }
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        fillColor: Colors.green,
                        constraints: const BoxConstraints.tightFor(
                          width: 300,
                          height: 50,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: index == 0
                            ? const Text(
                                "Next Page",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              )
                            : const Text(
                                "Get Started",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
