import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class CardAppearance extends StatefulWidget {
  CardAppearance(
      {@required this.resultSecondsLater, @required this.resultImageDisplay});

  final int resultSecondsLater;
  final bool resultImageDisplay;

  @override
  CardAppearanceState createState() => CardAppearanceState();
}

class CardAppearanceState extends State<CardAppearance> {
  bool _opacityLevel = false;
  int count = 0;
  int fadeInSeconds = 1;
  String imageCard = 'images/heart_nine.jpg';

  Future<void> applyCardChange(resultSecondsLater) async {
    Duration secondsLater = Duration(seconds: resultSecondsLater);
    Vibration.vibrate(duration: 100);
    // print('onTaped');
    await Future.delayed(secondsLater, () {});
    setState(() {
      print('appear!!');

      if (count == 0) {
        _opacityLevel =! _opacityLevel;
        fadeInSeconds = 1;
        imageCard = 'images/heart_nine.jpg';
        count++;
        // print(count);
      } else if (count == 1) {
        fadeInSeconds = 3;
        _opacityLevel =! _opacityLevel;
        imageCard = 'images/spade_ace.jpg';
        count++;
        // print(count);
      } else if (count == 2) {
        _opacityLevel =! _opacityLevel;
        fadeInSeconds = 3;
        // imageCard = 'images/spade_ace.jpg';
        count = count - 2;
        // print(count);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _opacityLevel = widget.resultImageDisplay;
  }

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
                    opacity: _opacityLevel ? 1.0 : 0.0,
                    duration: Duration(seconds: fadeInSeconds),
                    child: Image.asset(
                      imageCard,
                      width: 400.0,
                    ),
                  ),
                ),
                onTap: () {
                  applyCardChange(widget.resultSecondsLater);
                  print('${widget.resultSecondsLater} seconds later');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
