import 'package:flutter/material.dart';

class SliverDemo extends StatelessWidget {
  const SliverDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // 1. SliverAppBar
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('SliverAppBar Demo'),
              background: Image.network(
                'https://picsum.photos/id/10/600/400',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. SliverList (Nội dung)
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return ListTile(title: Text('Item #$index'));
            }, childCount: 30),
          ),
        ],
      ),
    );
  }
}
