import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thực hành 02',
      debugShowCheckedModeBanner: false,
      home: const EmailCheckScreen(),
    );
  }
}

class EmailCheckScreen extends StatefulWidget {
  const EmailCheckScreen({super.key});

  @override
  State<EmailCheckScreen> createState() => _EmailCheckScreenState();
}

class _EmailCheckScreenState extends State<EmailCheckScreen> {
  final TextEditingController emailController = TextEditingController();
  String message = '';

  void checkEmail() {
    String email = emailController.text.trim();

    setState(() {
      if (email.isEmpty) {
        message = "Email không hợp lệ";
      } else if (!email.contains('@')) {
        message = "Email không đúng định dạng";
      } else {
        message = "Bạn đã nhập email hợp lệ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thực hành 02')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: TextStyle(
                color: message.contains('hợp lệ') ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: checkEmail,
              child: const Text('Kiểm tra'),
            ),
          ],
        ),
      ),
    );
  }
}
