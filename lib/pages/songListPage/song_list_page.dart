import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/entity/playlist_hot_response.dart';
import 'package:netease_cloud_music_app/pages/songListPage/song_list_page_content.dart';
import 'package:netease_cloud_music_app/router/router_utils.dart';
import 'package:netease_cloud_music_app/store/song_list_page_model.dart';
import 'package:netease_cloud_music_app/widget/pageLoading/page_loading.dart';
import 'package:provider/provider.dart';

// 歌单广场
class SongListPage extends StatefulWidget {
  @override
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  TabController _controller;
  List<PlayListHotResponse> _tabValues = [];
  List<PlayListHotResponse> _boutique = [
    PlayListHotResponse.fromJson({'name': '推荐', 'id': 888}),
    PlayListHotResponse.fromJson({'name': '精品', 'id': 999})
  ];
  bool forcedRefresh = false;

  void updateTabValue(list) {
    _controller = TabController(
      length: list.length,
      vsync: ScrollableState(),
    );
    setState(() {
      _tabValues = list;
    });
  }

  void getSongListTag(bool flag) {
    if (flag == false) {
      SongListPageModel.getSongListTag(context: context, boutique: _boutique, updateTabValue: updateTabValue);
    } else {
      // 修改tab页签数据强制刷新所有页面
      setState(() {
        forcedRefresh = true;
      });
      SongListPageModel.getSongListTag(context: context, boutique: _boutique, updateTabValue: updateTabValue);
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          forcedRefresh = false;
        });
        _controller.animateTo(0);
      });
    }
  }

  @override
  void initState() {
    getSongListTag(false);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_tabValues.length <= 0) {
      return PageLoading();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('歌单广场'),
        centerTitle: false,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 40.0),
                child: TabBar(
                    tabs: _tabValues.map((element) {
                      return Text(
                        element.name == null ? element : element.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500, color: element.id == 888 || element.id == 999 ? Colors.amber[900] : Colors.black54),
                      );
                    }).toList(),
                    controller: _controller,
                    indicatorColor: Colors.red,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.black,
                    indicatorWeight: 2.0,
                    labelPadding: EdgeInsets.only(left: 20.0, right: 20.0),
                    labelStyle: TextStyle(height: 2),
                    onTap: (index) => {}),
              ),
              Positioned(
                right: 5.0,
                top: 5.0,
                child: GestureDetector(
                  child: Icon(
                    IconData(0xe61d, fontFamily: 'customFont'),
                    size: 30.0,
                    color: Colors.black54,
                  ),
                  onTap: () => {RouterUtils.navigateTo(context, '/songListTag').then((data) => getSongListTag(true))},
                ),
              )
            ],
          ),
        ),
      ),
      body: forcedRefresh == true
          ? PageLoading()
          : Container(
              child: TabBarView(
                controller: _controller,
                children: _tabValues.map((item) {
                  // if (forcedRefresh) return PageLoading();
                  return SongListPageContent(category: item);
                }).toList(),
              ),
            ),
    );
  }
}
