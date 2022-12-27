import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hot_expenses/app/controllers/app_controller.dart';
import 'package:hot_expenses/app/routes/routes.dart';
import 'package:hot_expenses/app/ui/expense_ui/add_expense.dart';
import 'package:hot_expenses/app/ui/expense_ui/expenseListBuld.dart';

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
          onPressed: () async {
            Get.dialog(Padding(
              padding: const EdgeInsets.only(
                  top: 40.0, left: 25, bottom: 20, right: 25),
              child: Center(child: Container(child: ExpenseUI())),
            ));
          },
          child: Icon(
            Icons.add,
          ),
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                
                backgroundColor: Colors.white,
                expandedHeight: size.height * 0.5,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.all(5.0),
                  title: Container(
                    height: size.height * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                title: Container(
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
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good Morning',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                              Text(
                                'Home Expenses !',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        child: IconButton(
                          icon: Icon(Icons.usb_rounded),
                          onPressed: () => Get.toNamed(AppRoutes.USERS),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          }),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              ],
            ),
          ),
        ));
  }
}

/**
 * 
 
  Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  width: double.infinity,
                  child: ExpeseListBuild(controller: controller),
                ),
              ),
  
  
 */
