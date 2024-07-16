import 'package:smart_edu_tea/state/page_prov.dart';
import 'package:smart_edu_tea/state/sidebar_prov.dart';
import 'package:smart_edu_tea/state/theme_prov.dart';
import 'package:smart_edu_tea/state/user_prov.dart';

class ProvManager {
  static late ThemeProv themeProv;
  static late PageProv pageProv;
  static late SidebarProv sidebarProv;
  static late UserProv userProv;

  static void init(){
    themeProv = ThemeProv();
    sidebarProv = SidebarProv();
    pageProv = PageProv();
    userProv = UserProv();
  }
}