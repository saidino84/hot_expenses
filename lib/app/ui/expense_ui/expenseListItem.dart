import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hot_expenses/app/controllers/app_controller.dart';
import 'package:hot_expenses/app/db/models/expense.dart';

class ExpenseItem extends GetView<HomeController> {
  final int index;
  final ExpenseModel expenseModel;
  ExpenseItem({
    Key? key,
    required this.index,
    required this.expenseModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ExpenseModel expenseModel = controller.expenses.value.elementAt(index);
    DateTime data = DateTime.fromMicrosecondsSinceEpoch(
        expenseModel.date!.microsecondsSinceEpoch);
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text("${expenseModel.title}"),
        leading: CircleAvatar(
          backgroundColor: expenseModel.done!
              ? Theme.of(context).primaryColor
              : Theme.of(context).secondaryHeaderColor,
          child: IconButton(
            onPressed: () => controller.update_expense(expenseModel),
            icon: Icon(
              expenseModel.done!
                  ? Icons.done
                  : Icons.power_settings_new_rounded,
            ),
          ),
        ),
        subtitle: Text(
          ("${data.day}/${data.month}/${data.year}"),
        ),
        trailing: Text("${expenseModel.amount}"),
      ),
    );
  }
}
