import 'package:flutter/material.dart';

class DismissibleDemo extends StatefulWidget {
  const DismissibleDemo({Key? key}) : super(key: key);

  @override
  _DismissibleDemoState createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends State<DismissibleDemo> {
  // Danh sách item (State)
  final List<String> _items = List.generate(20, (i) => 'Item ${i + 1}: Vuốt');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo Vuốt để Xóa (Dismissible)')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final String item = _items[index];

          // Bọc ListTile bằng Dismissible
          return Dismissible(
            // Cung cấp Key duy nhất
            key: Key(item),

            // Xử lý logic sau khi vuốt
            onDismissed: (direction) {
              final String removedItem = _items.removeAt(index);
              final int removedIndex = index;

              // Cập nhật UI
              setState(() {});

              // Hiển thị SnackBar với nút "Hoàn tác" (Undo)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$removedItem đã bị xóa!'),
                  action: SnackBarAction(
                    label: 'Hoàn tác',
                    onPressed: () {
                      setState(() {
                        _items.insert(removedIndex, removedItem);
                      });
                    },
                  ),
                ),
              );
            },

            // Nền màu đỏ khi vuốt
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),

            // Widget chính
            child: ListTile(
              title: Text(item),
              leading: Icon(Icons.list_alt_rounded),
            ),
          );
        },
      ),
    );
  }
}
