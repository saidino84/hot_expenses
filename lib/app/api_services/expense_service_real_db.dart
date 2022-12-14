import 'package:firebase_database/firebase_database.dart';
import 'package:hot_expenses/app/db/models/expense.dart';

class ExpenseRealDbService {
  ExpenseRealDbService._internal();

  static ExpenseRealDbService get instance => ExpenseRealDbService._internal();
  FirebaseDatabase get real_database => FirebaseDatabase.instance;
  DatabaseReference get real_database_ref => real_database.ref();

  DatabaseReference get real_db_expense_reference =>
      real_database_ref.child('expense_app').child('expenses');

  Future<void> upload_expense_rdb({required ExpenseModel expenseModel}) async {
    DatabaseReference _id = real_database_ref.child(expenseModel.user!).push();
    ExpenseModel _expense = expenseModel.copyWith(id: _id.key);

    try {
      _id.update(_expense.toJson);
    } catch (e) {}
  }

  Stream<List<ExpenseModel>> getExpensesStream({int? limit}) {
    var _expenses =
        real_db_expense_reference.orderByKey().limitToLast(limit ?? 20).onValue;

    var _expenseStream = _expenses.map((event) {
      final expense_json = Map<String, dynamic>.from(
          event.snapshot.value as Map<String, dynamic>);
      final expenseList = expense_json.entries.map((element) {
        return ExpenseModel.fromJson(Map<String, dynamic>.from(element.value));
      }).toList();
      return expenseList;
    });
    return _expenseStream;
  }
}
