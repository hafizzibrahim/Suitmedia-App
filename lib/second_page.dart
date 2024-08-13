import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String name;

  const SecondPage({super.key, required this.name});

  @override
  // ignore: library_private_types_in_public_api
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String? selectedUserName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              widget.name,
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            Center(
              child: Text(
                selectedUserName ?? 'Selected User Name',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const Spacer(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/third-page');
                if (result != null && result is String) {
                  setState(() {
                    selectedUserName = result;
                  });
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
                'Choose a User',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
