import 'package:hot_expenses/app/api_services/user_service_realdb.dart';

import '../models/user_model.dart';

class UserProvider {
  UserProvider._internaml();
  static UserProvider get instance => UserProvider._internaml();
  UserRealDbService _userdbService = UserRealDbService.instance;

  Future<List<UserModel>> getUserinDb() async {
    return await _userdbService.getUserModels();
  }

  Future<void> addUser(
      {String? id, required String name, required String phone}) async {
    await _userdbService.createUser(
        userModel: UserModel(id: id, name: name, phone_number: phone));
  }

  Stream<List<UserModel>> getUsersStream({int? limit}) {
    return _userdbService.getUsersStream(limit: limit);
  }
}
