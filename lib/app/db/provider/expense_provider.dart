import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseProvider {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  get_simple_data() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('hot_expense/');
    await users.get();
    return users.get().then((value) => print(value));
  }
}
