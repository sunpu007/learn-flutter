import 'dart:async';

import 'package:flutter/material.dart';
import './main.dart';

class StartPage extends StatefulWidget {
  static final String routeName = '/';

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  Timer _timer;
  int currTime = 5;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: Duration.microsecondsPerMillisecond), (timer) {
      setState(() {
        currTime--;
      });
      if (currTime == 0) {
        _timer.cancel();
        Navigator.of(context).pushReplacementNamed(MyStackPage.routeName);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '这是启动页$currTime',
          style: TextStyle(
            fontSize: 50
          ),
        ),
      ),
    );
  }
}

