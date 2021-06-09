import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, lowerBound: 50, upperBound: 150, duration: Duration(milliseconds: 1000));
    _controller.addListener(() {
      setState(() {
      });
    });
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('小组'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.favorite, color: Colors.red, size: _controller.value,),
            RaisedButton(
              child: Icon(Icons.play_arrow),
              onPressed: () {
                _controller.forward();
              },
            )
          ],
        ),
      ),
    );
  }
}
