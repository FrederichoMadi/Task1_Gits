import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget formField(
  String label,
  TextEditingController controller,
  String text,
) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      hintText: label,
      fillColor: Colors.white,
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.white,
        ),
      ),
    ),
    validator: (String? value) {
      if (value!.isEmpty) {
        return "Field ini tidak boleh kosong";
      }
      controller.text = value;
      text = controller.text;
      return null;
    },
  );
}
