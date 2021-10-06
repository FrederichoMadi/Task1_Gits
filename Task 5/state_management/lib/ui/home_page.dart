import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:state_management/model/data.dart';
import 'package:state_management/provider/data_provider.dart';
import 'package:state_management/ui/add_update_page.dart';
import 'package:state_management/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Mobile App Inventaris",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: double.infinity,
                  child:
                      Consumer<DataProvider>(builder: (context, data, child) {
                    return data.listData.isEmpty
                        ? const Center(
                            child: Text("Data is Empty"),
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: data.listData.length,
                            itemBuilder: (context, index) {
                              return CardWidget(
                                data: data.listData[index],
                              );
                            },
                          );
                  }),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUpdatePage(),
            ),
          ),
        ));
  }
}
