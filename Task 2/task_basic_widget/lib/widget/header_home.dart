import 'package:flutter/material.dart';
import 'package:task_basic_widget/model/user.dart';

Widget headerHome() {
  return Container(
    child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Image(
                image: NetworkImage(
                  user.image,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                '1000',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Posts',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                '2000',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Followers',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                '1000',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Following',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
