import 'package:flutter/material.dart';

// ----- Đây là trang con của ListView Thường -----
class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(100, (index) {
          print('ListView thường đang build item: $index');
          return ListTile(
            title: Text('Item $index'),
            leading: Icon(Icons.square, size: 12),
          );
        }),
      ),
    );
  }
}

// ----- Đây là trang con của ListView.builder -----
class BuilderDemo extends StatelessWidget {
  const BuilderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          print('ListView.builder đang build item: $index');
          return ListTile(
            title: Text('Item $index'),
            leading: Icon(Icons.circle, size: 12),
          );
        },
      ),
    );
  }
}

// ----- Đây là trang chính cho Demo 1 (chứa TabBar) -----
class ListViewComparisonDemo extends StatelessWidget {
  const ListViewComparisonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 2 tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text('So sánh ListView'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.warning), text: 'ListView (Chậm)'),
              Tab(icon: Icon(Icons.check_circle), text: 'Builder (Nhanh)'),
            ],
          ),
        ),
        body: const TabBarView(
          // Ngăn TabBarView tự build trước
          physics: NeverScrollableScrollPhysics(),
          children: [ListViewDemo(), BuilderDemo()],
        ),
      ),
    );
  }
}
