import 'package:flutter/material.dart';
import '../widgets/component_card.dart';

class ComponentListScreen extends StatelessWidget {
  const ComponentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final components = [
      {'title': 'Text', 'subtitle': 'Displays text', 'route': '/textDetail'},
      {'title': 'Image', 'subtitle': 'Displays an image'},
      {'title': 'TextField', 'subtitle': 'Input field for text'},
      {'title': 'PasswordField', 'subtitle': 'Input field for passwords'},
      {'title': 'Column', 'subtitle': 'Arranges elements vertically'},
      {'title': 'Row', 'subtitle': 'Arranges elements horizontally'},
    ];

    return Scaffold(
      backgroundColor: Colors.white, // Nền trắng tinh
      appBar: AppBar(
        title: const Text(
          'UI Components List',
          style: TextStyle(
            color: Color.fromARGB(255, 78, 140, 232), // xanh dương đậm
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF0D47A1)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Display",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            ...components
                .take(2)
                .map(
                  (c) => ComponentCard(
                    title: c['title']!,
                    subtitle: c['subtitle']!,
                    onTap: () {
                      if (c['route'] != null) {
                        Navigator.pushNamed(context, c['route']!);
                      }
                    },
                  ),
                ),
            const SizedBox(height: 16),
            const Text(
              "Input",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            ...components
                .skip(2)
                .take(2)
                .map(
                  (c) => ComponentCard(
                    title: c['title']!,
                    subtitle: c['subtitle']!,
                    onTap: () {},
                  ),
                ),
            const SizedBox(height: 16),
            const Text(
              "Layout",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            ...components
                .skip(4)
                .map(
                  (c) => ComponentCard(
                    title: c['title']!,
                    subtitle: c['subtitle']!,
                    onTap: () {},
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
