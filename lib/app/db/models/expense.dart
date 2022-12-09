import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseModel {
  String? title;
  bool? done;
  dynamic? amount;
  Timestamp? date;
  String? id;

  ExpenseModel({this.amount, this.date, this.done, this.title, this.id});

  bool set_it_done() {
    done = !done!;
    return done!;
  }

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
        amount: json['amount'],
        date: json['date'],
        done: json['done'] as bool,
        title: json['title']);
  }

  ExpenseModel copyWith(
      {double? amount,
      Timestamp? date,
      bool? done,
      String? title,
      String? id}) {
    return ExpenseModel(
        amount: amount ?? this.amount,
        date: date ?? this.date,
        done: done ?? this.done,
        id: id ?? this.id,
        title: title ?? this.title);
  }
}
