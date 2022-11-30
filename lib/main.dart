import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hot_expenses/app/routes/routes.dart';

void main(List<String> args) {
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.HOMEPAGE,
      getPages: AppPages.pages,
    );
  }
}
