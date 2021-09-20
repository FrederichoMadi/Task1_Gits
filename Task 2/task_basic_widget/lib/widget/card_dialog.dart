import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:task_basic_widget/model/user.dart';
import 'package:task_basic_widget/ui/home/home_page.dart';

Widget dialogCard(BuildContext context, User user) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    child: contentBox(context),
  );
}

contentBox(BuildContext context) {
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.only(
          left: 20,
          top: 20,
          bottom: 20,
          right: 20,
        ),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 8), blurRadius: 10),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Simpan Data?",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              "Name : ${user.name}",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              "Username : ${user.username}",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              "Biografi : ${user.biografi}",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              "Website : ${user.website}",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              "Tanggal Lahir : ${user.date}",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              "Gender : ${user.gender}",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Kembali"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, MyHomePage.routeName);
                    },
                    child: Text("Simpan"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
