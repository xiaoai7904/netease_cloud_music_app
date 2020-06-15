import 'package:flutter/material.dart';

class Hidden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Offstage(
      offstage: false,
      child: new Container(
        color: Colors.orange,
        height: 0.0,
        child: new Center(
          child: new Text(''),
        ),
      ),
    );
  }
}
