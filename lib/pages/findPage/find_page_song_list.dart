import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/entity/personalized_response.dart';
import 'package:netease_cloud_music_app/widget/horizontalList/horizontal_list.dart';

class FindPageSongList extends StatelessWidget {
  final List<PersonalizedResponse> personalized;

  FindPageSongList({Key key, this.personalized}) : super(key: key);

  List<Widget> _createSongItem() {
    return personalized
        .map((item) => HorizontalList(
              picUrl: item.picUrl,
              name: item.name,
              playCount: '${(item.playCount / 10000).floor()}万',
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('推荐歌单', style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w700)),
              DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
                      child: Text(
                        '查看更多',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ),
                  ))
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _createSongItem(),
            ),
          )
        ],
      ),
    );
  }
}
