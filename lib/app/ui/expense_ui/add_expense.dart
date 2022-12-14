import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';

import '../../controllers/expense_controller.dart';

class ExpenseUI extends GetView<ExpenseController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Text('Title'),
          TextField(),
        ],
      ),
    );
  }
}
