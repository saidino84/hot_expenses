import 'package:flutter/material.dart';
import 'package:hot_expenses/app/controllers/app_controller.dart';
import 'package:hot_expenses/app/db/models/expense.dart';

import 'expenseListItem.dart';

class ExpeseListBuild extends StatelessWidget {
  const ExpeseListBuild({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ExpenseModel>>(
        stream: controller.repository.expense_service.getExpenses_Stream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              // TODO: Handle this case.
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
              List<ExpenseModel> expenses = snapshot.data!;
              if (expenses.isNotEmpty) {
                return ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (ctx, index) {
                      return ExpenseItem(
                        index: index,
                        expenseModel: expenses[index],
                      );
                    });
              }
              break;
            case ConnectionState.done:
              // TODO: Handle this case.
              break;
          }
          return Center(
            child: Text('_Home'),
          );
        });
  }
}
