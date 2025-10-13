import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Phần trên: Logo + Tiêu đề + Mô tả
              Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ), // 👈 Kéo toàn bộ cụm xuống thấp hơn
                  Image.asset(
                    'assets/images/jetpack_logo.png',
                    width: 160, // 👈 Logo to hơn
                    height: 160,
                  ),
                  const SizedBox(height: 36), // 👈 Giãn cách giữa logo và chữ
                  const Text(
                    'Jetpack Compose',
                    style: TextStyle(
                      fontSize: 24, // to hơn 1 chút
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative programming approach.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                ],
              ),

              // Phần dưới: Button “I’m ready”
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/components');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "I'm ready",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 40), // Khoảng cách tới đáy màn hình
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
