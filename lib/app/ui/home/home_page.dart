import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hot_expenses/app/controllers/app_controller.dart';
import 'package:hot_expenses/app/db/models/expense.dart';

class HomePage extends GetView<HomeController> {
  // Get.LazyPut(()=>HomeController());

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => HomeController());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: Color.fromARGB(238, 240, 240, 240),
        backgroundColor: Colors.white.withOpacity(0.97),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                padding: EdgeInsets.all(20),
                height: size.height * 0.15,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Color.fromARGB(255, 236, 234, 228),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Text(
                          'Home Expenses !',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      child: Icon(
                        Icons.notifications,
                      ),
                    ),
                  ],
                ),
              ),

              // CARTAO DECREDITO OU DEBITO
              Container(
                height: size.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 8.0,
                ),
                child: Text('Transations'),
              ),
              Container(
                height: size.height * 0.10,
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: size.height * 0.10,
                        // width: size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green[100],
                              child: Icon(
                                Icons.restart_alt,
                                color: Colors.green,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Income',
                                  style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('+35%'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: size.height * 0.10,
                        // width: size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.amber[100],
                              child: Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Expense',
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('+68%'),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  width: double.infinity,
                  child: ExpeseListBuild(controller: controller),
                ),
              ),
            ],
          ),
        ));
  }
}

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
