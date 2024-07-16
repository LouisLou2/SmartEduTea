import 'package:flutter/material.dart';

import 'bar_tile.dart';

class SidebarData{
  late List<BarTile> barTiles;
  late Widget header;

  SidebarData({
    required this.barTiles,
    required this.header,
  }){
    equipId();
  }
  void equipId(){
    int count=0;
    for(int i=0;i<barTiles.length;++i){
      final barTile=barTiles[i];
      if(barTile.subs==null){
        barTile.id=count++;
        continue;
      }
      for(int j=0; j < barTile.subs!.length; ++j){
        barTile.subs![j].id=count++;
      }
    }
  }
}