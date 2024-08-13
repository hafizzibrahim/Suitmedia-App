import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_app/provider/user_provider.dart';
import 'package:suitmedia_app/widgets/user_tile_list.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider()..fetchUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Third Screen'),
        ),
        body: Consumer<UserProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading && provider.users.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.isEmpty) {
              return const Center(child: Text('No Users Found'));
            }

            return RefreshIndicator(
              onRefresh: () => provider.fetchUsers(isRefresh: true),
              child: ListView.builder(
                itemCount: provider.users.length + (provider.hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == provider.users.length) {
                    provider.fetchUsers();
                    return const Center(child: CircularProgressIndicator());
                  }

                  final user = provider.users[index];
                  return UserListTile(user: user);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
