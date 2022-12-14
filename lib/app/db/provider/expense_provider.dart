import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hot_expenses/app/api_services/expense_service_real_db.dart';
import 'package:hot_expenses/app/db/models/expense.dart';

class ExpenseProvider {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  ExpenseRealDbService get expenseRealDbService =>
      ExpenseRealDbService.instance;

  Stream<List<ExpenseModel>> get get_expenses_stream_rdb =>
      ExpenseRealDbService.instance.getExpensesStream(limit: 50);
}
