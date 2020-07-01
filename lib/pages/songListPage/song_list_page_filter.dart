import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/entity/catlist_response.dart';
import 'package:netease_cloud_music_app/store/song_list_page_model.dart';
import 'package:netease_cloud_music_app/utils/utils.dart';
import 'package:netease_cloud_music_app/widget/webview/page_web_view.dart';
import 'package:provider/provider.dart';

// 精品歌单过滤页面
class SongListPageFilter extends StatefulWidget {
  final  List<CatlistResponse> catlist;
  SongListPageFilter({Key key, this.catlist});

  @override
  _SongListPageFilterState createState() => _SongListPageFilterState();
}

class _SongListPageFilterState extends State<SongListPageFilter> {
  // // 全部分类
  // List<CatlistResponse> _catlist = [];

  @override
  void initState() {
    super.initState();
    // SongListPageModel.requestCatList(context: context).then((data) => setState(() => {_catlist = data['list']}));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 25,
          width: double.infinity,
          color: Colors.black54,
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 60.0,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '选择你喜欢的分类',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Consumer<SongListPageModel>(builder: (context, SongListPageModel songListPageModel, child) {
                      return FlatButton(
                        color: songListPageModel.filterValue == '全部' ? Colors.red[400] : Utils.hex2Color('#eaeaea'),
                        textColor: songListPageModel.filterValue == '全部' ? Colors.white : Colors.black54,
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "全部歌单",
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          Provider.of<SongListPageModel>(context, listen: false).setFilterValue('全部');
                          Navigator.of(context).pop('全部');
                        },
                      );
                    }),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height - 300.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, //每行三列
                        childAspectRatio: 2.2,
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                        //显示区域宽高相等
                      ),
                      itemCount: widget.catlist.length,
                      itemBuilder: (context, index) {
                        var name = widget.catlist.elementAt(index).name;
                        return Consumer<SongListPageModel>(builder: (context, SongListPageModel songListPageModel, child) {
                          return FlatButton(
                            color: songListPageModel.filterValue == name ? Colors.red[400] : Utils.hex2Color('#eaeaea'),
                            textColor: songListPageModel.filterValue == name ? Colors.white : Colors.black54,
                            padding: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            child: Wrap(
                              children: <Widget>[
                                Text(
                                  name,
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )
                              ],
                            ),
                            onPressed: () {
                              Provider.of<SongListPageModel>(context, listen: false).setFilterValue(name);
                              Navigator.of(context).pop(name);
                            },
                          );
                        });
                      }),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PageWebView(
                          webViewUrl: 'https://music.163.com/m/topic?id=202001',
                        );
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.help_outline,
                        color: Colors.black45,
                        size: 24,
                      ),
                      Text(
                        ' 什么是精品歌单',
                        style: TextStyle(color: Colors.black45, fontSize: 16),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
