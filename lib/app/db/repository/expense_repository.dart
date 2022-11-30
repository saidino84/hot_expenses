import 'dart:math';

import 'package:get/get.dart';
import 'package:hot_expenses/app/db/models/expense.dart';

class ExpenseRepository {
  final List<ExpenseModel> espenses = List.generate(10, (index) {
    return ExpenseModel(
        amount: index * 12.3,
        date: '${index} sep,2022',
        done: Random.secure().nextBool(),
        title: 'Expense ${index + 1}');
  });
}