import 'package:flutter/material.dart';

class SubBarTile{
  int id;
  String title;
  IconData? icon;
  VoidCallback? onTap;

  SubBarTile({
    this.id=-1,
    required this.title,
    this.icon,
    this.onTap,
  });
}