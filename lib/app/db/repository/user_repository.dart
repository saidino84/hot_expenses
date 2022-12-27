import 'dart:math';

import 'package:hot_expenses/app/db/models/user_model.dart';
import 'package:hot_expenses/app/db/provider/user_provider.dart';

class UsersRepository {
  UserModel get fkuser => UsersRepository
      .users[Random.secure().nextInt(UsersRepository.users.length)];

  static List<UserModel> get users => [
        UserModel(name: 'saidino', phone_number: '872988328'),
        UserModel(
            name: 'claudia',
            phone_number: '8404767438',
            id: '-NKFW8lYIYz2cFdHZvsk'),
        UserModel(name: 'ancha', phone_number: '86042403'),
        UserModel(name: 'faquito', phone_number: '875421658'),
      ];

  UserProvider get userProvider => UserProvider.instance;

  Future<UserModel> getLastUser() async {
    UserModel user = UserModel();
    await userProvider.getUserinDb().then((value) {
      user.copyWith(
          name: value.last.name,
          phone_number: value.last.phone_number,
          id: value.last.id);
      print('user set');
    });
    return user;
  }

  Stream<List<UserModel>> getUsersAsStream({int? limit}) =>
      userProvider.getUsersStream(limit: limit);

  Future<List<UserModel>> get getUsers async =>
      await userProvider.getUserinDb();

  Future<void> add_user_in_db({required UserModel userModel}) async {
    userProvider.addUser(
        name: userModel.name ?? '',
        phone: userModel.phone_number ?? '',
        id: userModel.id);
  }
}
