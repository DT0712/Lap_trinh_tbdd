import 'package:flutter/material.dart';
import 'intro_screen.dart'; // ✅ Thêm import IntroScreen

class TextDetailScreen extends StatelessWidget {
  const TextDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Text Detail',
          style: TextStyle(color: Color(0xFF2B86E6)),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color(0xFF2B86E6),
          onPressed: () {
            // ✅ Khi bấm back, quay thẳng về IntroScreen và xóa toàn bộ stack
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const IntroScreen()),
              (route) => false,
            );
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'The ', style: TextStyle(fontSize: 24)),
                TextSpan(
                  text: 'quick ',
                  style: TextStyle(
                    fontSize: 24,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(
                  text: 'B',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'rown ',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: 'fox ', style: TextStyle(fontSize: 24)),
                TextSpan(
                  text: 'j u m p s ',
                  style: TextStyle(fontSize: 24, letterSpacing: 2),
                ),
                TextSpan(
                  text: 'over ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'the ',
                  style: TextStyle(
                    fontSize: 24,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'lazy ',
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                ),
                TextSpan(text: 'dog.', style: TextStyle(fontSize: 24)),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
