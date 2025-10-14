import 'package:flutter/material.dart';

class ColumnLayoutScreen extends StatelessWidget {
  const ColumnLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 👈 Nền toàn màn hình trắng hoàn toàn
      appBar: AppBar(
        title: const Text(
          'Column Layout',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ), // kéo nhóm khối lên gần tiêu đề
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5), // 👈 chỉ khung này có nền xám nhẹ
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildBox(Colors.green.shade200),
                const SizedBox(height: 10),
                buildBox(Colors.green.shade400),
                const SizedBox(height: 10),
                buildBox(Colors.green.shade200),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBox(Color color) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
