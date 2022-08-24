import 'package:flutter/cupertino.dart';

class TodoModel {
  IconData icon;
  String title;
  String description;
  String time;
  TodoModel({
    required this.icon,
    required this.time,
    required this.description,
    required this.title,
  });
}
