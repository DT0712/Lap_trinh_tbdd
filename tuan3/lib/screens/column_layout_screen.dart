import 'package:flutter/material.dart';
import 'intro_screen.dart';

class ColumnLayoutScreen extends StatefulWidget {
  const ColumnLayoutScreen({super.key});

  @override
  State<ColumnLayoutScreen> createState() => _ColumnLayoutScreenState();
}

class _ColumnLayoutScreenState extends State<ColumnLayoutScreen> {
  int selectedIndex = 1; // ✅ Mặc định ô giữa đậm
  final int itemCount = 10; // ✅ Số lượng ô hiển thị (tùy chỉnh)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Column Layout',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      // ✅ Dùng ListView.builder để tạo LazyColumn
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              shrinkWrap: true, // ✅ Giúp danh sách co giãn vừa nội dung
              physics: const BouncingScrollPhysics(),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: buildBox(index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Hàm build từng ô (box)
  Widget buildBox(int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade400 : Colors.green.shade200,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          'Box ${index + 1}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: isSelected ? 20 : 16,
          ),
        ),
      ),
    );
  }
}
