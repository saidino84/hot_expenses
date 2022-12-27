import 'package:get/state_manager.dart';
import 'package:hot_expenses/app/db/models/user_model.dart';
import 'package:hot_expenses/app/db/repository/user_repository.dart';

class UsersController extends GetxController {
  final UsersRepository repository;
  UsersController({required this.repository});

  Future<void> add_fakeUser() async {
    for (var element in UsersRepository.users) {
      await repository.add_user_in_db(userModel: element);
      print('done');
    }
    ;
    print('added');
  }

  Future<UserModel> get getLastUser async => await repository.getLastUser();
}
