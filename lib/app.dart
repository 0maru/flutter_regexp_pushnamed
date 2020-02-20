import 'package:flutter/material.dart';
import 'package:regexp_pushnamed/router.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Router.rootPath,
      onGenerateRoute: Router().generateRoute,
    );
  }
}
