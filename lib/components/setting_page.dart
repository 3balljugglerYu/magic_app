import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'resable_card.dart';

enum Gender {
  male,
  female,
}

class SettingPage extends StatefulWidget {
  @override
  _SettingPage createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  Gender selectedGender;
  int secondsLater = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
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
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x1fEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: secondsLater.toDouble(),
                      min: 1.0,
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
            height: 500.0,
          )
        ],
      ),
    );
    // BottomButton(
    //   buttonTitle: 'CALCULATE',
    //   onTap: () {
    //     CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => ResultsPage(
    //           bmiResult: calc.calculateBMI(),
    //           resultText: calc.getResult(),
    //           interpretation: calc.getInterpretation(),
    //         ),
    //       ),
    //     );
    //   },
    // )
    //     ],
    //   ),
    // );
  }
}
