import '../const_data/const_data.dart';

class AppLink {
  //remote address
  static String appRoot = "http://192.168.1.7:8000/api";

  static String signin = "$appRoot/login";
  static String signup = "$appRoot/register";
  static String logout = "$appRoot/logout";
  static String me = "$appRoot/me";
  //static String profileImage = "$appRoot/profileImage";
  Map<String, String> getHeader() {
    Map<String, String> mainHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    };
    return mainHeader;
  }

  Map<String, String> getHeaderToken() {
    Map<String, String> mainHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': 'Bearer${ConstData.token}'
    };
    return mainHeader;
  }
}
