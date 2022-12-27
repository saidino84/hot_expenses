import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:hot_expenses/app/controllers/user_controller.dart';
import 'package:hot_expenses/app/db/repository/user_repository.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UsersRepository());
    Get.lazyPut(() => UsersController(repository: Get.find()));
  }
}
