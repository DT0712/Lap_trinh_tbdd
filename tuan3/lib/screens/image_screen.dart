import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  final String imageUrl =
      'https://giaothongvantaitphcm.edu.vn/wp-content/uploads/2025/01/Logo-GTVT.png';

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(
      'https://giaothongvantaitphcm.edu.vn/wp-content/uploads/2025/01/Logo-GTVT.png',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Không mở được link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Images',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ẢNH ĐẦU (UTH_1)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/uth_2.png', fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),

            // ĐƯỜNG LINK
            GestureDetector(
              onTap: _launchURL,
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

            // ẢNH THỨ 2 (UTH_2)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/uth_1.png', fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),

            // CHÚ THÍCH ẢNH
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
