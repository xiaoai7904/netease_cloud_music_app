import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/entity/playlist_hot_response.dart';
import 'package:netease_cloud_music_app/store/song_list_page_model.dart';
import 'package:netease_cloud_music_app/utils/utils.dart';
import 'package:netease_cloud_music_app/widget/sortableView/sortable_view.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

// 歌单广场标签编辑页面
class SongListPageTag extends StatefulWidget {
  @override
  _SongListPageTagState createState() => _SongListPageTagState();
}

class _SongListPageTagState extends State<SongListPageTag> {
  bool isEdit = false;
  List<Widget> buttonList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('歌单标签'),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
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
                          borderSide: BorderSide(color: Colors.red),
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
                      buttonList = songListPageModel.mySongList.map((item) {
                        return FlatButton(
                          color: Utils.hex2Color('#eaeaea'),
                          textColor: Colors.black54,
                          padding: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          disabledColor: Utils.hex2Color('#f1f1f1'),
                          disabledTextColor: Utils.hex2Color('#d8d8d8'),
                          child: Wrap(
                            children: <Widget>[
                              Text(
                                item.name,
                                style: TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          onPressed: isEdit == true && (item.id == 888 || item.id == 999) ? null : () {},
                          // onLongPress: isEdit == true && (item.id == 888 || item.id == 999)
                          //     ? null
                          //     : () {
                          //         setState(() {
                          //           isEdit = true;
                          //         });
                          //       },
                        );
                      }).toList();

                      return ReorderableWrap(
                        spacing: 8.0, // 主轴(水平)方向间距
                        runSpacing: 4.0, // 纵轴（垂直）方向间距
                        alignment: WrapAlignment.start, //沿主轴方向
                        buildDraggableFeedback: (BuildContext context, BoxConstraints boxConstraints, Widget widget) {
                          return widget;
                        },
                        onReorder: (int oldIndex, int newIndex) {
                          if(oldIndex == 0 || oldIndex == 1 || newIndex == 0 || newIndex == 1) return;
                          SongListPageModel.updateSortCatTag(context: context, oldIndex: oldIndex, newIndex: newIndex);
                        },
                        children: buttonList,
                      );
                    }),
                  ),
                ],
              )),
        ));
  }
}
