import 'package:get/get.dart';
import 'package:hot_expenses/app/controllers/app_controller.dart';

class HomeBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
