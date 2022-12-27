import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:hot_expenses/app/controllers/user_controller.dart';
import 'package:hot_expenses/app/db/models/user_model.dart';

class UserPage extends GetView<UsersController> {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: StreamBuilder<List<UserModel>>(
        stream: controller.repository.getUsersAsStream(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('004\\t ${snapshot.error}'),
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
              // TODO: Handle this case.

              if (snapshot.hasData) {
                List<UserModel> users = snapshot.data!;

                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (ctx, index) {
                      var user = users[index];
                      var name = user.name ?? '';
                      return const ListTile(
                        title: Text('user loaded...'),
                      );
                    });
              }
              break;
            case ConnectionState.done:
              // TODO: Handle this case.
              break;
          }
          return Center(
            child: Text('Loaded'),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.add_fakeUser();
      }),
    );
  }
}
