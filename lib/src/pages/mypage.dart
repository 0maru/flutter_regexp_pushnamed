import 'package:flutter/material.dart';
import 'package:regexp_pushnamed/src/pages/pages.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  static const pagePath = '/';

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'test',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('${DetailPage.pagePath}');
              },
              child: Text('${DetailPage.pagePath}'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('https://www.sukima.me/search?keyword=test');
              },
              child: Text('/search?keyword=test'),
            ),
          ],
        ),
      ),
    );
  }
}
