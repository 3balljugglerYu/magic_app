import 'package:flutter/material.dart';
import 'next_practice_page.dart';

class PracticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('練習ページ'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: '名前を入力してね'),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              children: [
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
