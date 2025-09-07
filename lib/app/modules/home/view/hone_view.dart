import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo/app/data/models/user_model.dart';
import 'package:get_x_demo/app/modules/home/controller/home_controller.dart';
import 'package:get_x_demo/app/modules/home/view/widgets/user_card.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.hasError.value) {
                return const Center(child: Text("Error loading users."));
              }
              if (controller.users.isEmpty) {
                return const Center(child: Text("No user found."));
              }
              return ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final user = controller.users[index];
                  return UserCard(
                    user: user,
                    onTap: () => _showUserDetails(context, user),
                    onDelete: () => _showDeleteDialog(context, user)
                    ,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  _showUserDetails(BuildContext context, UserModel user) {
    showModalBottomSheet(context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)))
        , builder: (context) => UserDetailsSheet(user: user,));
  }

  void  _showDeleteDialog(BuildContext context, UserModel user) {
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: const Text("Delete User"),
          content: Text('Are you sure want to delte ${user.name}'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
            TextButton(onPressed: () {
              Navigator.pop(context);

            },
                child: const Text(
                  'Delete', style: TextStyle(color: Colors.red),)),

          ],
        ));
  }


}
