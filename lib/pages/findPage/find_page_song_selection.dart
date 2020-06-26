import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:netease_cloud_music_app/entity/personalized_new_song_response.dart';
import 'package:netease_cloud_music_app/widget/cachedNetworkImage/cached_network_image.dart';

class FindPageSongSelection extends StatelessWidget {
  final List<List<PersonalizedNewSongResponse>> convertPersonalizedSong;

  FindPageSongSelection({Key key, this.convertPersonalizedSong}) : super(key: key);

  Widget _createSongItem(BuildContext context, PersonalizedNewSongResponse rowItem) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width - 60.0,
        margin: EdgeInsets.only(top: 10.0, right: 0.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImageWidget(imageUrl: rowItem.picUrl, width: 50.0, height: 50.0),
              // child: Image.network(rowItem.picUrl, width: 50.0, height: 50.0, fit: BoxFit.cover),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 150.0,
              margin: EdgeInsets.only(left: 8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        rowItem.name,
                        style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w300),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        ' - ',
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                      Text(
                        rowItem.song.artists.map((item) => item.name).join('/'),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      rowItem.song.album.type,
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
            Icon(Icons.play_circle_filled, color: Colors.red),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('推荐歌曲', style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w700)),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: GestureDetector(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.play_arrow,
                              size: 14,
                              color: Colors.black54,
                            ),
                            Text(
                              ' 播放全部',
                              style: TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 180.0,
            child: Swiper(
              loop: false,
              itemCount: convertPersonalizedSong.length,
              autoplayDelay: 5000,
              viewportFraction: 0.9,
              duration: 1000,
              onTap: (int index) {},
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: convertPersonalizedSong[index].map((itemRow) {
                    return _createSongItem(context, itemRow);
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
