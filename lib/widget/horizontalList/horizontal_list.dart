import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/widget/hidden/hidden.dart';

class HorizontalList extends StatelessWidget {
  final String picUrl;
  final String name;
  final String playCount;
  final String username;
  final double width;
  final double height;
  final double picHeight;

  HorizontalList({Key key, @required this.picUrl, @required this.name, this.playCount, this.username = '', this.width = 110.0, this.height = 155.0, this.picHeight = 110.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(top: 15.0, right: 10.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(picUrl, height: picHeight, fit: BoxFit.cover),
                ),
                playCount == ''
                    ? Hidden()
                    : Positioned(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 12,
                            ),
                            Text(
                              '$playCount ',
                              style: TextStyle(color: Colors.white, fontSize: 12, shadows: [Shadow(color: Colors.white, offset: Offset(0, 0), blurRadius: 5)]),
                            )
                          ],
                        ),
                        width: 110.0,
                        top: 0.0,
                        left: 0.0,
                        bottom: 85.0,
                      ),
                username == ''
                    ? Hidden()
                    : Positioned(
                        child: Text(
                          username,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        top: 90.0,
                        left: 5.0,
                        bottom: 0.0,
                      )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
