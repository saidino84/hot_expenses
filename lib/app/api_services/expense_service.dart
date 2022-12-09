import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hot_expenses/app/db/models/expense.dart';

class ExpenseService {
  CollectionReference _expense_references =
      FirebaseFirestore.instance.collection('hot_expense');

  List<ExpenseModel> get_expense_fstore_query(QuerySnapshot snapshot) {
    return snapshot.docs.map((document_json) {
      Map<String, dynamic> data = document_json.data() as Map<String, dynamic>;

      ExpenseModel expense =
          ExpenseModel.fromJson(data).copyWith(id: document_json.id);
      return expense;
    }).toList();
  }

  Stream<List<ExpenseModel>> getExpenses_Stream() {
    return _expense_references.snapshots().map(get_expense_fstore_query);
  }
}
