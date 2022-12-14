import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseModel {
  String? title;
  bool? done;
  dynamic? amount;
  Timestamp? date;
  String? id;
  String? user;

  ExpenseModel(
      {this.amount, this.date, this.done, this.title, this.id, this.user});

  bool set_it_done() {
    done = !done!;
    return done!;
  }

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      amount: json['amount'],
      date: json['date'],
      done: json['done'] as bool,
      title: json['title'],
      user: json['user'],
    );
  }

  ExpenseModel copyWith(
      {double? amount,
      Timestamp? date,
      bool? done,
      String? title,
      String? user,
      String? id}) {
    return ExpenseModel(
        amount: amount ?? this.amount,
        date: date ?? this.date,
        done: done ?? this.done,
        id: id ?? this.id,
        user: user ?? this.user,
        title: title ?? this.title);
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'title': title,
        'done': done,
        'user': done,
        'amount': amount,
        'date': date,
      };
}
