import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/utils/utils.dart';
import 'package:netease_cloud_music_app/widget/cachedNetworkImage/cached_network_image.dart';
import 'package:netease_cloud_music_app/widget/hidden/hidden.dart';

class HorizontalList extends StatelessWidget {
  final String picUrl;
  final String name;
  final int playCount;
  final String username;
  final double width;
  final double height;
  final double picHeight;
  final double bottom;

  HorizontalList({
    Key key,
    @required this.picUrl,
    @required this.name,
    this.playCount = 0,
    this.username = '',
    this.width = 110.0,
    this.height = 155.0,
    this.picHeight = 110.0,
    this.bottom = 85.0,
  }) : super(key: key);

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
                  child: CachedNetworkImageWidget(imageUrl: picUrl, width: width, height: picHeight),
                ),
                playCount == 0
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
                              '${Utils.numFormat(playCount)}  ',
                              style: TextStyle(color: Colors.white, fontSize: 12, shadows: [Shadow(color: Colors.white, offset: Offset(0, 0), blurRadius: 5)]),
                            )
                          ],
                        ),
                        width: width,
                        top: 0.0,
                        left: 0.0,
                        bottom: bottom,
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
