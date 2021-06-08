import '../main.dart';
import '../startPage.dart';

class AppRouter {

  static final String initialRoute = StartPage.routeName;

  static final routers = {
    StartPage.routeName: (ctx) => StartPage(),
    MyStackPage.routeName: (ctx) => MyStackPage(),
  };
}