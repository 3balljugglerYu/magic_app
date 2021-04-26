import 'package:flutter/material.dart';
import 'package:magic_app/components/setting_page.dart';
import 'screens/coin_appearance.dart';
import 'screens/card_appearance.dart';
import 'screens/practice_page.dart';
import 'components/setting_page.dart';
import 'screens/image_select.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Making Magic',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: TopPage(),
    );
  }
}

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Making Magic"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
            ),
            // Expanded(
            //   flex: 3,
            //   child: Card(
            //     shadowColor: Color.fromRGBO(0, 0, 0, 1.0),
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10.0)),
            //     elevation: 10.0,
            //     margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            //     child: InkWell(
            //       splashColor: Colors.blue.withAlpha(30),
            //       // onTap: (() {
            //       //   Navigator.push(
            //       //       context,
            //       //       MaterialPageRoute(
            //       //           builder: (context) => CardAppearance()));
            //       // }),
            //       child: Column(
            //         children: [
            //           const ListTile(
            //             leading: Icon(Icons.album),
            //             title: Text(
            //               'カードの出現',
            //               style: TextStyle(fontSize: 18.0),
            //             ),
            //             subtitle: Text(
            //               'タップ後、3秒後にカードが出現します',
            //               style: TextStyle(fontSize: 13.0),
            //             ),
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               Text('この現象へ移動'),
            //               SizedBox(width: 8.0),
            //               Text('Go!'),
            //               Icon(Icons.arrow_right),
            //               SizedBox(width: 20.0),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Expanded(
            //   flex: 3,
            //   child: Card(
            //     shadowColor: Color.fromRGBO(0, 0, 0, 1.0),
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10.0)),
            //     elevation: 10.0,
            //     margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            //     child: InkWell(
            //       splashColor: Colors.blue.withAlpha(30),
            //       onTap: (() {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => CoinAppearance()));
            //       }),
            //       child: Column(
            //         children: [
            //           const ListTile(
            //             leading: Icon(Icons.album),
            //             title: Text(
            //               'コインの出現と消失',
            //               style: TextStyle(fontSize: 18.0),
            //             ),
            //             subtitle: Text(
            //               'ロングタップ毎に出現と消失を繰り返します。',
            //               style: TextStyle(fontSize: 13.0),
            //             ),
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               Text('この現象へ移動'),
            //               SizedBox(width: 8.0),
            //               Text('Go!'),
            //               Icon(Icons.arrow_right),
            //               SizedBox(width: 20.0),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 3,
              child: TopPageCard(
                icon: Icons.album,
                text: 'プログラミング練習用',
                subText: 'セッティングページで設定した秒数を、画像を表示するタイミングに設定。',
                transitionDestination: MaterialPageRoute(
                  builder: (context) => SettingPage(),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: TopPageCard(
                icon: Icons.album,
                text: '画像取り込み練習',
                subText: '画像ライブラリから、画像を選択＆表示。',
                transitionDestination: MaterialPageRoute(
                                  builder: (context) => ImageSelect(),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopPageCard extends StatelessWidget {
  const TopPageCard({this.icon, this.text, this.subText, this.transitionDestination});

  final IconData icon;
  final String text;
  final String subText;
  final Route transitionDestination;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      elevation: 10.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: (() async {
          final result = await Navigator.push(
            context,
            transitionDestination,
          );
          print(result);
        }),
        child: Column(
          children: [
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(icon),
              title: Text(
                text,
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                subText,
                style: TextStyle(fontSize: 13.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('この現象へ移動'),
                SizedBox(width: 8.0),
                Text('Go'),
                Icon(Icons.arrow_right),
                SizedBox(width: 20.0),
              ],
            )
          ],
        ),
      ),
    );
  }
}
