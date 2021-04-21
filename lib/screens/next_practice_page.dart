import 'package:flutter/material.dart';

class NextPracticePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          '戻る',
          // style: kButtonTextStyle,
        ),
      ),
    );
  }
}