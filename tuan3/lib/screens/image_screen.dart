import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'intro_screen.dart'; // ✅ Thêm import để quay về IntroScreen

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  // ✅ Link ảnh thật trên website UTH
  final String imageUrl =
      'https://giaothongvantaitphcm.edu.vn/wp-content/uploads/2025/01/Logo-GTVT.png';

  // ✅ Hàm mở link ngoài trình duyệt
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Không mở được link: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () {
            // ✅ Khi bấm back, quay về IntroScreen và xóa các màn hình trước đó
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const IntroScreen()),
              (route) => false,
            );
          },
        ),
        title: const Text(
          'Images',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      // ✅ Cuộn mượt với nhiều hình
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/uth_2.png', fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),

            // ✅ Nhấn vào link sẽ mở ngoài trình duyệt
            GestureDetector(
              onTap: () => _launchURL(imageUrl),
              child: Text(
                imageUrl,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 20),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/uth_1.png', fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),

            const Text(
              'In app',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
