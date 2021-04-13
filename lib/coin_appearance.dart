import 'package:flutter/material.dart';

class CoinAppearance extends StatefulWidget {
  @override
  CoinAppearanceState createState() => CoinAppearanceState();
}

class CoinAppearanceState extends State<CoinAppearance> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Appear and Disappear"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Center(
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 1),
                    child: Image.asset(
                      'images/500yen.png',
                      width: 150.0,
                    ),
                  ),
                ),
                onLongPress: () {
                  print('onLongTap');
                  setState(() {
                    _visible = !_visible;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
