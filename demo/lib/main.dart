import 'package:flutter/material.dart';
import 'demo_dismissible.dart';
import 'demo_listview_comparison.dart';
import 'demo_sliver.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoMenuPage(),
    );
  }
}

// Trang Menu chính
class DemoMenuPage extends StatelessWidget {
  const DemoMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tổng hợp Flutter Demos')),
      body: ListView(
        children: [
          // Nút 1: Điều hướng đến Demo ListView
          _DemoMenuItem(
            title: 'Demo 1: ListView vs. ListView.builder',
            subtitle: 'Slide 4 / Chương 5 - Demo hiệu suất',
            icon: Icons.list_alt,
            // Trang demo 1
            destination: const ListViewComparisonDemo(),
          ),

          // Nút 2: Điều hướng đến Demo Sliver
          _DemoMenuItem(
            title: 'Demo 3: SliverAppBar (Cuộn co dãn)',
            subtitle: 'Slide 6 / Chương 6 - Demo hiệu ứng cuộn',
            icon: Icons.vertical_align_top,
            // Trang demo 3
            destination: const SliverDemo(),
          ),

          // Nút 3: Điều hướng đến Demo Dismissible
          _DemoMenuItem(
            title: 'Demo 4: Dismissible (Vuốt để xóa)',
            subtitle: 'Slide 9 / Chương 7 - Demo cử chỉ',
            icon: Icons.swipe_left_alt,
            // Trang demo 4
            destination: const DismissibleDemo(),
          ),
        ],
      ),
    );
  }
}

// Widget phụ trợ cho item menu
class _DemoMenuItem extends StatelessWidget {
  const _DemoMenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.destination,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Hành động: Điều hướng (push) đến màn hình demo tương ứng
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
