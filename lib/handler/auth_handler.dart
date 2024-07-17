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
    _preferences.setString('token', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUR1QtNC1SRXh6UDRXaTZQMG01WnV3QTVUeldBTTNvV0o4ZHVRTUI2RDlXd3dMNnkxR2NuMnp0eGp4UGFwbWg4Vmx2eDBPaHZJLWlaMGpsMmNuNGo5dWQ5NnJiYmQ0cXBaIiwiZXhwIjoxNzIxMTMxMjA2LCJpYXQiOjE3MjExMjc2MDZ9.vKJpFz4LADoNJNjtmgOPFk4aoc4bqvayBZWmfrraDzA');
    String? token = _preferences.getString('token');
    // !!!!!!!!!!!!!!!!!!!
    // token = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUR1QtNC1SRXh6UDRXaTZQMG01WnV3QTVUeldBTTNvV0o4ZHVRTUI2RDlXd3dMNnkxR2NuMnp0eGp4UGFwbWg4Vmx2eDBPaHZJLWlaMGpsMmNuNGo5dWQ5NnJiYmQ0cXBaIiwiZXhwIjoxNzIxMTMxMjA2LCJpYXQiOjE3MjExMjc2MDZ9.vKJpFz4LADoNJNjtmgOPFk4aoc4bqvayBZWmfrraDzA';
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