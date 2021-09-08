import 'package:flutter/material.dart';
import 'package:task_basic_widget/gridphoto_page.dart';
import 'package:task_basic_widget/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.black,
        title: Text('fredericho_madi'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Icon(Icons.add_box_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: ListView(
        children: [
          ProfilePage(),
          SizedBox(height: 8),
          Container(
            height: 40,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.white),
                      ),
                    ),
                    child: Icon(Icons.border_all),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Icon(Icons.person_pin_circle_outlined),
                  ),
                ]),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0),
          //   child: Text(
          //     'Postingan',
          //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          //   ),
          // ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridPhoto(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 4,
        selectedIconTheme: IconThemeData(color: Colors.white),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter_outlined),
            label: 'IG Tv',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
