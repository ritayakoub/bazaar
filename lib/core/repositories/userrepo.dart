import 'package:bazaar2/core/const_data/list.dart';

import 'package:bazaar2/view/home/model/usermodel.dart';

class UserRepository {
  static Future<List<UserModel>> fetchuser() async {
    return usermodel;
  }
}
