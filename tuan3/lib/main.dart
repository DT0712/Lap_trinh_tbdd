import 'package:flutter/material.dart';
import 'screens/intro_screen.dart';
import 'screens/component_list_screen.dart';
import 'screens/text_detail_screen.dart';
import 'screens/image_screen.dart';
import 'screens/textfield_screen.dart';
import 'screens/row_layout_screen.dart';
import 'screens/column_layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compose UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroScreen(),
        '/components': (context) => const ComponentListScreen(),
        '/textDetail': (context) => const TextDetailScreen(),
        '/image': (context) => const ImageScreen(),
        '/textfield': (context) => const TextFieldScreen(),
        '/rowlayout': (context) => const RowLayoutScreen(),
        '/columnlayout': (context) => const ColumnLayoutScreen(),
      },
    );
  }
}
