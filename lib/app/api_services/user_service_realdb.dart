import 'package:firebase_database/firebase_database.dart';
import 'package:hot_expenses/app/db/models/user_model.dart';

class UserRealDbService {
  UserRealDbService._internal();

  static UserRealDbService get instance => UserRealDbService._internal();
  FirebaseDatabase get real_database => FirebaseDatabase.instance;
  DatabaseReference get dbref => real_database.ref();
  DatabaseReference get dbuserRef => dbref.child('expense_app').child('users');

  Future createUser({required UserModel userModel}) async {
    print('received user ${userModel.name}');
    late DatabaseReference _id;
    try {
      if (userModel.id != null) {
        _id = dbuserRef.child(userModel.id!);
      } else {
        _id = dbuserRef.push();
      }
    } catch (e) {}
    UserModel _user = userModel.copyWith(id: _id.key);

    try {
      await _id.update(_user.toJosn);
      print('User Uploaded sucess full');
    } catch (e) {}
  }

  Future<List<UserModel>> getUserModels() async {
    var _users_ref = await dbuserRef.get();
    var userList = <UserModel>[];
    var users = _users_ref.value as Map<String, dynamic>;
    users.forEach((key, value) {
      final UserModel userModel = UserModel.fromJson(value);
      userList.add(userModel);
    });

    return userList;
  }

  Stream<List<UserModel>> getUsersStream({int? limit}) {
    var _users_streamdb_event =
        dbuserRef.orderByKey().limitToLast(limit ?? 20).onValue;
    var _usersStream = _users_streamdb_event.map((event) {
      final _usersJson = Map<String, dynamic>.from(
          event.snapshot.value as Map<String, dynamic>);
      final _users_list = _usersJson.entries.map((element) {
        return UserModel.fromJson(Map<String, dynamic>.from(element.value));
      }).toList();
      return _users_list;
    });
    return _usersStream;
  }
}
