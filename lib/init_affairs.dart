import 'package:flutter/material.dart';
import 'package:smart_edu_tea/const/app_param.dart';
import 'package:smart_edu_tea/const/config.dart';
import 'package:smart_edu_tea/data/basic_data.dart';
import 'package:smart_edu_tea/datasourse/manage/net_config.dart';
import 'package:smart_edu_tea/entity/general/result.dart';
import 'package:smart_edu_tea/handler/auth_handler.dart';
import 'package:smart_edu_tea/state/prov_manager.dart';
import 'package:smart_edu_tea/style/style_scheme.dart';
import 'package:smart_edu_tea/style/theme_vault.dart';

import 'datasourse/imple/basic_info_ds.dart';
import 'entity/resp/place_time.dart';

void uiInit(){
  ThemeVault.light = ThemeVault.light.copyWith(
    colorScheme: ThemeVault.light.colorScheme.copyWith(
      onInverseSurface: const Color(0xfff6f6f9),
      surfaceContainerHighest: const Color(0xfff8f8f9),
      surfaceContainerHigh: const Color(0xfff8f8f9),
    ),
  );
  StyleScheme.setOnSuface(
    lightOnSufColor: ThemeVault.light.colorScheme.onSurface,
    darkOnSufColor: ThemeVault.dark.colorScheme.onSurface,
    lightSufColor: ThemeVault.light.colorScheme.surface,
    darkSufColor: ThemeVault.dark.colorScheme.surface,
  );
}

Future<void> initBeforeRun() async {
  uiInit();
  ProvManager.init();// userProv 要在 SetToken之后
  NetworkConfig.init();// 要在 userProv之后
  equipBasics();
  ProvManager.themeProv.setThemeMode(ThemeMode.light);
}

Future<void> authInit() async {
  String? token = Uri.base.queryParameters['token']; //get token from ur
  // ensureBinding
  WidgetsFlutterBinding.ensureInitialized();
  await AuthHandler.init();
  if(token!=null){
    AuthHandler.setToken(token);
  }else{
    AuthHandler.checkToken();
  }
}


Future<void> equipBasics() async{
  Result<PlaceTime> pt = await BasicInfoDs.getTimePlace();
  for(int i=0;i<Configs.maxRetry;++i){
    if(pt.isSuccess){
      BasicData.init(
        campuses1: pt.data!.campusList,
        nowWeek1: pt.data!.nowWeek,
        nowTermPart1: pt.data!.nowTermPart,
        earliestTermYear1: pt.data!.earliestTermYear,
        earliestTermPart1: pt.data!.earliestTermPart,
        schools1: pt.data!.schoolMajorList,
      );
      break;
    }
  }
  // 这里若都不成功，应该要提示网络问题，然后给出重试按钮。这里先不做了
}