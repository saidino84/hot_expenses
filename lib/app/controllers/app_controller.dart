import 'package:get/state_manager.dart';
import 'package:hot_expenses/app/db/models/expense.dart';
import 'package:hot_expenses/app/db/repository/expense_repository.dart';

class HomeController extends GetxController {
  final repository = ExpenseRepository();
  final expenses = <ExpenseModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    expenses.value = repository.espenses;
    super.onInit();
  }

  update_expense(ExpenseModel expenseModel) {
    // bool _done = expenses.value.elementAt(index).done.value =
    //     !expenses.value.elementAt(index).done.value;
    // expenseModel.done = !expenseModel.done;
    print(expenseModel.done);
    expenseModel.done = !expenseModel.done;
    expenses.refresh();
    // update();
  }
}
