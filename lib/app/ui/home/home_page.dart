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
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                padding: EdgeInsets.all(20),
                height: size.height * 0.1,
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
                          style: TextStyle(color: Colors.grey),
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
              Container(
                height: size.height * 0.23,
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
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (ctx, index) {
                        return Obx(() {
                          ExpenseModel expenseModel =
                              controller.expenses.elementAt(index);
                          return ExpenseItem(
                            index: index,
                            expenseModel: expenseModel,
                          );
                        });
                      }),
                ),
              ),
            ],
          ),
        ));
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
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text("${expenseModel.title}"),
        leading: CircleAvatar(
          backgroundColor: expenseModel.done
              ? Theme.of(context).primaryColor
              : Theme.of(context).secondaryHeaderColor,
          child: IconButton(
            onPressed: () => controller.update_expense(expenseModel),
            icon: Icon(
              expenseModel.done ? Icons.done : Icons.power_settings_new_rounded,
            ),
          ),
        ),
        subtitle: Text(expenseModel.date),
        trailing: Text("${expenseModel.amount}"),
      ),
    );
  }
}
