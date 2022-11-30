class ExpenseModel {
  String title;
  bool done;
  double amount;
  String date;

  ExpenseModel({
    required this.amount,
    required this.date,
    required this.done,
    required this.title,
  });

  bool set_it_done() {
    done = !done;
    return done;
  }
}
