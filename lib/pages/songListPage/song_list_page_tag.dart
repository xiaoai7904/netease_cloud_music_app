import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/store/song_list_page_model.dart';
import 'package:netease_cloud_music_app/utils/utils.dart';
import 'package:provider/provider.dart';

// 歌单广场标签编辑页面
class SongListPageTag extends StatefulWidget {
  @override
  _SongListPageTagState createState() => _SongListPageTagState();
}

class _SongListPageTagState extends State<SongListPageTag> {
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('歌单标签'),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '我的歌单广场',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '(长按可编辑)',
                          style: TextStyle(color: Colors.black38, fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 70.0,
                      height: 30.0,
                      child: OutlineButton(
                        child: Text(
                          isEdit == true ? '完成' : '编辑',
                          style: TextStyle(fontSize: 14),
                        ),
                        textColor: Colors.red,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        highlightedBorderColor: Colors.red,
                        highlightColor: Colors.transparent,
                        borderSide: new BorderSide(color: Colors.red),
                        // padding: EdgeInsets.only(left: 5.0),
                        onPressed: () {
                          setState(() {
                            isEdit = !isEdit;
                          });
                        },
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Consumer<SongListPageModel>(builder: (context, SongListPageModel songListPageModel, child) {
                    return Wrap(
                      spacing: 8.0, // 主轴(水平)方向间距
                      runSpacing: 4.0, // 纵轴（垂直）方向间距
                      alignment: WrapAlignment.start, //沿主轴方向
                      children: songListPageModel.mySongList.map((item) {
                        return FlatButton(
                          color: Utils.hex2Color('#eaeaea'),
                          textColor: Colors.black54,
                          padding: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          child: Wrap(
                            children: <Widget>[
                              Text(
                                item.name,
                                style: TextStyle(fontSize: 14, color: Colors.black54),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                            ],
                          ),
                          onPressed: () {
                            // Provider.of<SongListPageModel>(context, listen: false).setFilterValue(name);
                            // Navigator.of(context).pop(name);
                          },
                        );
                      }).toList(),
                    );
                  }),
                ),
              ],
            )));
  }
}
