import 'package:flutter/material.dart';

class ColumnLayoutScreen extends StatefulWidget {
  const ColumnLayoutScreen({super.key});

  @override
  State<ColumnLayoutScreen> createState() => _ColumnLayoutScreenState();
}

class _ColumnLayoutScreenState extends State<ColumnLayoutScreen> {
  int selectedIndex = 1; // mặc định ô giữa đậm

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
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildBox(0),
                const SizedBox(height: 10),
                buildBox(1),
                const SizedBox(height: 10),
                buildBox(2),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
      ),
    );
  }
}
