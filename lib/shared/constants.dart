import 'package:flutter/material.dart';

const KtextDecoration = InputDecoration(
  // hintText: 'Email',
  hintStyle: TextStyle(color: Colors.red),
  fillColor: Colors.blueGrey,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
