import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/const/device.dart';
import 'package:smart_edu_tea/init_affairs.dart';
import 'package:smart_edu_tea/presentation/page/teacher_dash.dart';
import 'package:smart_edu_tea/state/prov_manager.dart';
import 'package:smart_edu_tea/style/theme_vault.dart';



void main(){
  String myurl = Uri.base.toString(); //get complete url
  // String para1 = Uri.base.queryParameters["para1"]; //get parameter with attribute "para1"
  // String para2 = Uri.base.queryParameters["para2"]; //get parameter with attribute "para2"
  print(myurl);
  uiInit();
  ProvManager.init();
  ProvManager.themeProv.setThemeMode(ThemeMode.light);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: DeviceDesignDraft.desktop,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: ProvManager.pageProv),
          ChangeNotifierProvider.value(value: ProvManager.themeProv),
          ChangeNotifierProvider.value(value: ProvManager.sidebarProv),
        ],
        child: ShadApp.material(
          themeMode: ProvManager.themeProv.mode,
          materialThemeBuilder: (context, theme) {
            if (theme.brightness == Brightness.light) {
              return theme.copyWith(
                primaryColorLight: ThemeVault.light.primaryColorLight,
                primaryColorDark: ThemeVault.light.primaryColorDark,
                textTheme: ThemeVault.light.textTheme,
                colorScheme: ThemeVault.light.colorScheme,
              );
            }
            return theme.copyWith(
              primaryColorLight: ThemeVault.dark.primaryColorLight,
              primaryColorDark: ThemeVault.dark.primaryColorDark,
              textTheme: ThemeVault.dark.textTheme,
              colorScheme: ThemeVault.dark.colorScheme,
            );
          },
          home: const TeaDashboard(),
        ),
      ),
    );
  }
}