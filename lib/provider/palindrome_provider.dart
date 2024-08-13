import 'package:flutter/material.dart';

class PalindromeProvider with ChangeNotifier {
  String _inputText = '';
  String _result = '';

  String get result => _result;
  String get inputText => _inputText;

  void setInputText(String text) {
    _inputText = text;
    notifyListeners();
  }

  void checkPalindrome(BuildContext context) {
    _result = _inputText == _inputText.split('').reversed.join('')
        ? 'Palindrom'
        : 'Bukan Palindrom';
    notifyListeners();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            _result == 'Palindrom' ? 'is Palindrome' : 'not palindrome',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
