import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class CardAppearance extends StatefulWidget {
  @override
  CardAppearanceState createState() => CardAppearanceState();
}

class CardAppearanceState extends State<CardAppearance> {
  double opacityLevel = 0.0;

  Future<double> secondsLater() async {
    Duration threeSeconds = Duration(seconds: 3);
    Vibration.vibrate(duration: 100);
    print('onTaped');
    await Future.delayed(threeSeconds, () {
      opacityLevel = opacityLevel == 0.0 ? 1.0 : 0.0;
      print('3 seconds later');
    });
    return opacityLevel;
  }

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
                    opacity: opacityLevel,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      'images/9ofHears.jpg',
                      width: 400.0,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    secondsLater();
                  });
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
