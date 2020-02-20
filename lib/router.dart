import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:regexp_pushnamed/src/pages/pages.dart';

class Router {
  static const rootPath = '/';

  final _regExpRouter = <RegExp, Widget Function(BuildContext, RouteSettings)>{
    RegExp('\^${MyPage.pagePath}\b'): (context, settings) => MyPage(),
    RegExp('\^${DetailPage.pagePath}'): (context, settings) => DetailPage(),
  };

  Route<dynamic> generateRoute(RouteSettings settings) {
    final path = urlParse(settings.name);
    final Widget Function(BuildContext, RouteSettings) pageBuilder = widgetMatch(settings.name);

    if (pageBuilder != null) {
      return CupertinoPageRoute<dynamic>(
        builder: (BuildContext context) => pageBuilder(context, settings),
        settings: settings,
      );
    }
    assert(false, 'unexpected settings: $settings');
    return null;
  }

  Widget Function(BuildContext, RouteSettings) widgetMatch(String path) {
    for (final RegExp reg in _regExpRouter.keys) {
      debugPrint('${reg}');
      if (reg == null) continue;
      if (reg.hasMatch(path)) return _regExpRouter[reg];
    }
    return (context, settings) => NotFoundPage();
  }

  /// https://www.sukima.me/book/title/shincho00000004/
  /// https://www.sukima.me/ 以降を取得する
  String urlParse(String url) {
    if (url.contains('sukima.me/')) {
      final uri = Uri.parse(url);
    }
    return url;
  }
}
