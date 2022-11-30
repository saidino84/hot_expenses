import 'package:get/get.dart';
import 'package:hot_expenses/app/bindings/app_bindings.dart';
import 'package:hot_expenses/app/ui/home/home_page.dart';

class AppRoutes {
  static String HOMEPAGE = '/home';
  static String OTHER = '/other';
}

class AppPages {
  static List<GetPage<HomePage>> pages = [
    GetPage(
      name: AppRoutes.HOMEPAGE,
      page: () => HomePage(),
      binding: HomeBidings(), //
    ),
  ];
}
