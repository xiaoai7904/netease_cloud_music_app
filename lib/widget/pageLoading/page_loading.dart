import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class PageLoading extends StatelessWidget {
  final double width;
  final double height;

  PageLoading({Key key, this.width = 40.0, this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: LoadingIndicator(
          indicatorType: Indicator.lineScale,
          color: Colors.red,
        ),
        width: width,
        height: height,
      ),
    );
  }
}
