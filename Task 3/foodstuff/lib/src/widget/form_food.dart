import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodstuff/src/data/food.dart';

Widget formFood(
  BuildContext context,
  Food food,
  TextEditingController urlImageController,
  TextEditingController nameFoodController,
  TextEditingController descriptionController,
  bool isUpdate,
) {
  return Column(
    children: [
      TextField(
        controller: urlImageController,
        decoration: const InputDecoration(
          labelText: "Url Image",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: nameFoodController,
        decoration: const InputDecoration(
          labelText: "Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: descriptionController,
        maxLines: 4,
        decoration: const InputDecoration(
          labelText: "description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          if (!isUpdate) {
            Food newFood = Food(
              name: nameFoodController.text,
              description: descriptionController.text,
              urlImage: urlImageController.text,
            );
            dummyData.add(newFood);
          } else {
            food.name = nameFoodController.text;
            food.description = descriptionController.text;
            food.urlImage = urlImageController.text;
          }
          Navigator.pop(context);
        },
        child: !isUpdate ? const Text("Simpan") : const Text("Update"),
      )
    ],
  );
}
