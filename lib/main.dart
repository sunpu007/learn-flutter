import 'package:flutter/material.dart';
import 'views/mall/mall.dart';
import 'views/profile/profile.dart';
import 'views/group/group.dart';
import 'views/subject/subject.dart';
import 'views/home/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
      ),
      home: MyStackPage()
    );
  }
}

class MyStackPage extends StatefulWidget {
  const MyStackPage({Key key}) : super(key: key);

  @override
  _MyStackPageState createState() => _MyStackPageState();
}

class _MyStackPageState extends State<MyStackPage> {
  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomePage(),
          SubjectPage(),
          GroupPage(),
          MallPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        selectedFontSize: 12.0,
        currentIndex: _currentIndex,
        items: [
          createItem("home", "首页"),
          createItem("subject", "书影音"),
          createItem("group", "小组"),
          createItem("mall", "市集"),
          createItem("profile", "我的"),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem createItem(String iconName, String title) {
    return BottomNavigationBarItem(
      title: Text(title),
      icon: Image.asset('assets/images/tabbar/$iconName.png', width: 30,),
      activeIcon: Image.asset('assets/images/tabbar/${iconName}_active.png', width: 30,),
    );
  }
}




