import 'dart:math';

import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  Animation<double> _sizeAnim;
  Animation<double> _rotationAnim;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

    _sizeAnim = Tween(begin: 50.0, end: 150.0).animate(_controller);
    _rotationAnim = Tween(begin: 0.0, end: pi * 2).animate(_controller);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: _controller,
            builder: (ctx, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(_rotationAnim.value),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: _sizeAnim.value,
                )
              );
            },
          ),
          RaisedButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              _controller.forward();
            },
          ),
        ],
      ),
    );
  }
}
