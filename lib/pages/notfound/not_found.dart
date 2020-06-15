import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        '404',
        style: TextStyle(fontSize: 20),
      ),
    ));
  }
}
