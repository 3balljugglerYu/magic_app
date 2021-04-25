import 'package:flutter/material.dart';
import 'bottom_button.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'package:magic_app/screens/card_appearance.dart';
import 'package:flutter/cupertino.dart';


class SettingPage extends StatefulWidget {
  @override
  _SettingPage createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  int secondsLater = 3;
  bool _imageDisplay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Card(
                shadowColor: Color.fromRGBO(0, 0, 0, 1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Display the image first',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('ON'),
                      ],
                    ),
                    MergeSemantics(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: ListTile(
                          title: Text('開始時に画像を表示させる'),
                          trailing: CupertinoSwitch(
                            value: _imageDisplay,
                            onChanged: (bool value) { setState(() { _imageDisplay = value; }); },
                          ),
                          onTap: () { setState(() { _imageDisplay = !_imageDisplay; }); },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Card(
                shadowColor: Color.fromRGBO(0, 0, 0, 1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fade In',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          secondsLater.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'seconds later',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0x7D8D8E98),
                        activeTrackColor: Colors.lightBlue.shade600,
                        thumbColor: Colors.lightBlue,
                        overlayColor: Color(0x7Db3e5fc),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: secondsLater.toDouble(),
                        min: 0.0,
                        max: 30.0,
                        onChanged: (double newValue) {
                          setState(() {
                            secondsLater = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 300.0,
            ),
            BottomButton(
              buttonTitle: 'Setting Complete',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardAppearance(
                      resultSecondsLater: secondsLater,
                      resultImageDisplay: _imageDisplay,
                    ),
                  ),
                );
                // print(secondsLater);
              },
            ),
          ],
        ),
      ),
    );
  }
}
