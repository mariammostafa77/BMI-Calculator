import 'package:flutter/material.dart';

Widget defaultButton({
  required String text,
  required VoidCallback function,
})=> Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(10.0)
    ),
    child: MaterialButton(
      onPressed: function,
      child:Text(text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );