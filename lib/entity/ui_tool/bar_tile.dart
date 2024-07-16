import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_edu_tea/entity/ui_tool/sub_bar_tile.dart';

class BarTile{
  int id;
  final IconData? icon;
  final String title;
  final List<SubBarTile>? subs;
  final void Function(bool)? onExpand;

  VoidCallback? onTap;

  BarTile({
    this.id=-1,
    required this.title,
    required this.subs,
    this.onExpand,
    this.icon,
    this.onTap,
  });

  BarTile.noSub({
    required this.title,
    this.icon,
    this.onTap,
  }): subs = null, onExpand = null, id=-1;

  get isExpansion => subs!=null;
}