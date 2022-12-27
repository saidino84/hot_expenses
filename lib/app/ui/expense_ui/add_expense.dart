import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';

import '../../controllers/expense_controller.dart';

class ExpenseUI extends GetView<ExpenseController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: size.height * 0.5,
        child: Column(
          children: [
            Text('Title'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(),
            ),
          ],
        ),
      ),
    );
  }
}
