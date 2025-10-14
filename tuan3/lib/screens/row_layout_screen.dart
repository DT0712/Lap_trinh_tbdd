import 'package:flutter/material.dart';

class RowLayoutScreen extends StatefulWidget {
  const RowLayoutScreen({super.key});

  @override
  State<RowLayoutScreen> createState() => _RowLayoutScreenState();
}

class _RowLayoutScreenState extends State<RowLayoutScreen> {
  int selectedColumnIndex =
      1; // ✅ Mặc định chọn cột giữa (0: trái, 1: giữa, 2: phải)

  @override
  Widget build(BuildContext context) {
    const lightBox = Color(0xFFD7E9FF); // xanh nhạt
    const darkBox = Color(0xFF3F8BE6); // xanh đậm
    const rowBg = Color(0xFFF6F8FA); // nền khung hàng

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Row Layout',
          style: TextStyle(
            color: Color(0xFF2B86E6),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color(0xFF2B86E6),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          children: List.generate(4, (rowIndex) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: rowBg,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(3, (colIndex) {
                    bool isSelected = selectedColumnIndex == colIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColumnIndex = colIndex;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 90,
                        height: 48,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          color: isSelected ? darkBox : lightBox,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.3),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : [],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
