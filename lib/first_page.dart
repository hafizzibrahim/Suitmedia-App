import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_app/provider/name_provider.dart';
import 'package:suitmedia_app/provider/palindrome_provider.dart';
import 'package:suitmedia_app/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NameProvider()),
        ChangeNotifierProvider(create: (context) => PalindromeProvider()),
      ],
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 116,
                  height: 116,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: const Icon(
                    Icons.person_add_alt_1,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Consumer<NameProvider>(
                  builder: (context, nameProvider, child) {
                    return TextField(
                      onChanged: (value) {
                        nameProvider.setName(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Consumer<PalindromeProvider>(
                  builder: (context, palindromeProvider, child) {
                    return TextField(
                      onChanged: (value) {
                        palindromeProvider.setInputText(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Palindrome',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),
                Consumer<PalindromeProvider>(
                  builder: (context, palindromeProvider, child) {
                    return ElevatedButton(
                      onPressed: () {
                        palindromeProvider.checkPalindrome(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B637B),
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Check',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Consumer<NameProvider>(
                  builder: (context, nameProvider, child) {
                    return ElevatedButton(
                      onPressed: () {
                        if (nameProvider.name.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SecondPage(name: nameProvider.name),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B637B),
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
