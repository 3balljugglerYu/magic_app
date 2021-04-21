import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class CardAppearance extends StatefulWidget {
  @override
  CardAppearanceState createState() => CardAppearanceState();
}

class CardAppearanceState extends State<CardAppearance> {
  double _opacityLevel = 0.0;
  int count = 1;
  int fadeInSeconds = 1;
  String imageCard = 'images/heart_nine.jpg';

  Future<void> secondsLater() async {
    Duration secondsLater = Duration(seconds: 3);
    Vibration.vibrate(duration: 100);
    print('onTaped');
    await Future.delayed(secondsLater, () {});
    setState(() {
      print('appear!!');
      if (count == 1) {
        _opacityLevel = _opacityLevel == 0.0 ? 1.0 : 0.0;
        fadeInSeconds = 1;
        count++;
        print(count);
      } else if (count == 2) {
        fadeInSeconds = 0;
        imageCard = 'images/spade_ace.jpg';
        count--;
        print(count);
      }
    });
  }

  void fadeInType() {}

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
                    opacity: _opacityLevel,
                    duration: Duration(seconds: fadeInSeconds),
                    child: Image.asset(
                      imageCard,
                      width: 400.0,
                    ),
                  ),
                ),
                onTap: () {
                  secondsLater();
                },
              ),
            ),
          ],
        ),
      ),
    );
    // }

    // );
  }
}
