// providers/user_provider.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia_app/model/user.dart';
import 'dart:convert';

class UserProvider with ChangeNotifier {
  final List<User> _users = [];
  int _page = 1;
  bool _hasMore = true;
  bool _isLoading = false;
  bool _isEmpty = false;

  List<User> get users => _users;
  bool get hasMore => _hasMore;
  bool get isLoading => _isLoading;
  bool get isEmpty => _isEmpty;

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    if (isRefresh) {
      _page = 1;
      _users.clear();
    }

    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=$_page&per_page=10'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<User> fetchedUsers = (data['data'] as List).map((user) {
        return User(
          id: user['id'].toString(),
          email: user['email'],
          firstName: user['first_name'],
          lastName: user['last_name'],
          avatar: user['avatar'],
        );
      }).toList();

      if (fetchedUsers.isEmpty && _page == 1) {
        _isEmpty = true;
      } else {
        _isEmpty = false;
        _page++;
        _users.addAll(fetchedUsers);
        _hasMore = data['page'] < data['total_pages'];
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}
