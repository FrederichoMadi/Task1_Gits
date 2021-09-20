import 'package:flutter/material.dart';
import 'package:task_basic_widget/model/user.dart';
import 'package:task_basic_widget/ui/biografi/biografi_page.dart';
import 'package:task_basic_widget/ui/home/gridphoto_page.dart';
import 'package:task_basic_widget/widget/botom_navigation.dart';
import 'package:task_basic_widget/widget/header_home.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = '/';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(user.username),
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headerHome(),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          user.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          user.biografi,
                        ),
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          user.website,
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width * 0.8,
                            child: OutlineButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, BiografiPage.routeName,
                                    arguments: user);
                              },
                              child: Text('Edit Profile'),
                              color: Colors.black,
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white54),
                              highlightedBorderColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width * 0.1,
                            child: OutlineButton(
                              onPressed: () {},
                              child: Icon(Icons.arrow_drop_down),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white54),
                              highlightedBorderColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 36,
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text('New'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(0, 0),
                child: Container(
                  child: TabBar(
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.border_all),
                      ),
                      Tab(
                        icon: Icon(Icons.person_pin_circle),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [GridPhoto(), TagPhotoImage()],
              ),
            )
          ],
        ),
        bottomNavigationBar: bottomNavigation(),
      ),
    );
  }
}
