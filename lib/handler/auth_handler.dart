import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_edu_tea/data/web_data.dart';
import 'package:smart_edu_tea/datasourse/manage/net_path_collector.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthHandler{
  static late final SharedPreferences _preferences;

  static Future<void> init() async{
    _preferences = await SharedPreferences.getInstance();
  }

  static checkToken() {
    // _preferences.setString('token', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUR1QtNS1EdTRHTkpxRmVGeUFRY0dzRC04dGRGQ2RRYjBqbHM3aGwxUHI2YTdVLUJLOGJ4SHlISXRETDhiLTZnYm1HS2F5ZFZvLWlaMGpsMmNuNGo5dWQ5NnJiYmQ0cXBaIiwiZXhwIjoxNzIxMjAxMTYyLCJpYXQiOjE3MjExOTc1NjJ9.G7EnKvKwZC4zeBLcnrVTPOi1dMx2LsyZe1Fin0uMBW0');
    String? token = _preferences.getString('token');
    if(token==null){
      goToLogin();
      return;
    }
  }

  static setToken(String token){
    _preferences.setString('token', token);
  }

  static getToken(){
    return _preferences.getString('token');
  }

  static void goToLogin(){
    launchUrl(
      Uri.http(
        NetworkPathCollector.getLoginPath(),'',{
          'redirect': WebData.thisUrl,
        },
      ),
      webOnlyWindowName: '_self',
    );
  }
}