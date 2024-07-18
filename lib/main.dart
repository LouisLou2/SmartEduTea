import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu_tea/const/device.dart';
import 'package:smart_edu_tea/data/web_data.dart';
import 'package:smart_edu_tea/init_affairs.dart';
import 'package:smart_edu_tea/presentation/page/course_detail.dart';
import 'package:smart_edu_tea/presentation/page/teacher_dash.dart';
import 'package:smart_edu_tea/presentation/page/upload_score.dart';
import 'package:smart_edu_tea/state/prov_manager.dart';
import 'package:smart_edu_tea/style/theme_vault.dart';
import 'package:toastification/toastification.dart';

void getAndSetUrl(){
  String myurl = Uri.base.toString(); //get complete url
  WebData.setUrl(myurl);
}

void main() async {
  getAndSetUrl();
  await authInit();
  await initBeforeRun();
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
          ChangeNotifierProvider.value(value: ProvManager.userProv),
          ChangeNotifierProvider.value(value: ProvManager.courseSchedProv),
          ChangeNotifierProvider.value(value: ProvManager.courseListProv),
          ChangeNotifierProvider.value(value: ProvManager.faultReportProv),
          ChangeNotifierProvider.value(value: ProvManager.classroomRecordProvider),
          ChangeNotifierProvider.value(value: ProvManager.studentScoreProv),
          ChangeNotifierProvider.value(value: ProvManager.basicDataProv),
          ChangeNotifierProvider.value(value: ProvManager.courseDetailProv),
        ],
        child: ToastificationWrapper(
          child: ShadApp.material(
            routes: {
              '/sscore': (context) => const StudentScoresRecord(),
              '/course_detail': (context) => const CourseDetailPage(),
            },
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
      ),
    );
  }
}