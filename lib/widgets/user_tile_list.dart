// widgets/user_list_tile.dart
import 'package:flutter/material.dart';
import 'package:suitmedia_app/model/user.dart';

class UserListTile extends StatelessWidget {
  final User user;

  const UserListTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.email),
      onTap: () {
        Navigator.pop(context, '${user.firstName} ${user.lastName}');
      },
    );
  }
}
