import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo/app/data/models/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const UserCard({
    Key? key,
    required this.user,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.yellow[200],
          child: Text(
            user.name!.isNotEmpty ? user.name![0].toUpperCase() : "?",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          user.name.toString(),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(user.email.toString()),
        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete, color: Colors.red),
        ),
        onTap: onTap,
      ),
    );
  }
}

class UserDetailsSheet extends StatelessWidget {
  final UserModel user;

  const UserDetailsSheet({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.yellow[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // now create User Avatar
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.brown[100],
            child: Text(
              user.name!.isNotEmpty ? user.name![0].toUpperCase() : "?",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16,),

          // close button

          ElevatedButton(onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Text('Close',style: TextStyle(color: Colors.white),)
          )

        ],
      ),
    );
  }
}
