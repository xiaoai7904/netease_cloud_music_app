import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:netease_cloud_music_app/entity/catlist_response.dart';
import 'package:netease_cloud_music_app/entity/playlist_hot_response.dart';
import 'package:netease_cloud_music_app/entity/top_play_list_response.dart';
import 'package:netease_cloud_music_app/pages/songListPage/song_list_page_filter.dart';
import 'package:netease_cloud_music_app/store/song_list_page_model.dart';
import 'package:netease_cloud_music_app/widget/cachedNetworkImage/cached_network_image.dart';
import 'package:netease_cloud_music_app/widget/hidden/hidden.dart';
import 'package:netease_cloud_music_app/widget/horizontalList/horizontal_list.dart';
import 'package:netease_cloud_music_app/widget/pageLoading/page_loading.dart';
import 'package:provider/provider.dart';

class SongListPageContent extends StatefulWidget {
  final PlayListHotResponse category;

  SongListPageContent({Key key, this.category});

  @override
  _SongListPageContentState createState() => _SongListPageContentState();
}

class _SongListPageContentState extends State<SongListPageContent> with AutomaticKeepAliveClientMixin {
  EasyRefreshController _easyRefreshController;
  Function({int offset}) _request;
  // 数据列表
  List<Playlists> _data = [];
  // 推荐歌单banner数据
  List<Playlists> _banner = [];
  // 偏移值
  int offset = 0;
  // 每页显示条数
  int limit = 18;
  // 是否数据已经到底
  bool isDataBottom = false;
  // 数据返回值
  Map<String, dynamic> _responseData = {};

  // 重置页面数据到第一页
  void resetPageData(Map<String, dynamic> data) {
    setState(() {
      if (widget.category.id == 888) {
        _banner = data['list'].sublist(0, 6);
        _data = data['list'].sublist(6, data['list'].length);
      } else {
        _data = data['list'];
      }
    });
  }

  // 滚动加载数据
  Future loadPageData(offset) {
    return _request(offset: offset).then(
      (value) => {
        setState(() {
          _data = _data + value['list'];
          if (value['requestResult'].data['total'] == _data.length || value['requestResult'].data['more'] == false) {
            isDataBottom = true;
          }
        })
      },
    );
  }

  // 初始化请求
  Future<Map<String, dynamic>> initRequest() async {
    _responseData = await _request(offset: 0);
    resetPageData(_responseData);
    return _responseData;
  }

  dynamic _isEmpty() {
    if (_data.isEmpty) {
      return Container(
        child: Center(
          child: Text(''),
        ),
      );
    }
    return null;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void updateKeepAlive() {
    super.updateKeepAlive();
  }

  @override
  void initState() {
    super.initState();
    _request = SongListPageModel.requestSongList(context: context, id: widget.category.id, limit: limit, name: widget.category.name);
    _easyRefreshController = EasyRefreshController();
  }

  // 精品页面
  Widget boutiquePageWidget() {
    if (widget.category.id == 999) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Consumer<SongListPageModel>(builder: (context, SongListPageModel songListPageModel, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    songListPageModel.filterValue,
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        // 存储上一次过滤值,返回弹窗后如果值不相同在进行数据更新,反之不更新
                        songListPageModel.setOldFilterValue(songListPageModel.filterValue);
                        Map<String, dynamic> catlistResponse = {};
                        // 如果全部歌单分类已经存在就使用缓存数据，反之请求新数据
                        if (songListPageModel.catlist.isEmpty) {
                          catlistResponse = await SongListPageModel.requestCatList(context: context);
                        } else {
                          catlistResponse = {'list': songListPageModel.catlist};
                        }

                        await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return SongListPageFilter(catlist: catlistResponse['list']);
                          },
                        );

                        if (songListPageModel.filterValue != songListPageModel.oldFilterValue) {
                          initRequest();
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              IconData(0xe699, fontFamily: 'customFont'),
                              size: 14,
                              color: Colors.black54,
                            ),
                            Text(
                              ' 筛选',
                              style: TextStyle(fontSize: 14, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            _data.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Center(
                      child: Text('暂无数据'),
                    ),
                  )
                : Hidden()
          ],
        ),
      );
    }
    return Hidden();
  }

  // 推荐页面
  Widget recommendPageWidget() {
    if (widget.category.id == 888) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              height: 320.0,
              padding: EdgeInsets.all(10.0),
              child: Swiper(
                autoplay: true,
                itemCount: _banner.length,
                viewportFraction: 0.6,
                scale: 0.8,
                autoplayDelay: 5000,
                duration: 1000,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Stack(
                                children: <Widget>[
                                  CachedNetworkImageWidget(
                                    imageUrl: _banner.elementAt(index).coverImgUrl,
                                    height: 240.0,
                                  ),
                                  Positioned(
                                    child: Opacity(
                                      opacity: 0.8,
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.play_arrow,
                                          size: 30.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    top: 180.0,
                                    right: 5.0,
                                    bottom: 0.0,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 50.0,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.black12,
                                      offset: new Offset(0.0, -3.0),
                                      blurRadius: 9.0,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  _banner.elementAt(index).name,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
          childCount: 1,
        ),
      );
    }
    return SliverOpacity(
      opacity: 0,
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[Hidden()],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          children: <Widget>[
            boutiquePageWidget(),
            Expanded(
              child: EasyRefresh.custom(
                controller: _easyRefreshController,
                firstRefresh: true,
                firstRefreshWidget: PageLoading(),
                emptyWidget: _isEmpty(),
                footer: ClassicalFooter(
                  noMoreText: '暂无更多歌单',
                  showInfo: false,
                ),
                onRefresh: () {
                  setState(() {
                    offset = 0;
                  });
                  return initRequest();
                },
                onLoad: () {
                  if (isDataBottom) {
                    return Future(() {
                      _easyRefreshController.finishLoad(success: true, noMore: true);
                    });
                  }

                  setState(() {
                    offset = offset + 1;
                  });
                  
                  return loadPageData(offset);
                },
                slivers: <Widget>[
                  recommendPageWidget(),
                  SliverGrid.count(
                    children: _data.map((item) {
                      return Container(
                        width: 130.0,
                        height: 200.0,
                        child: HorizontalList(
                          picUrl: item.coverImgUrl,
                          name: item.name,
                          playCount: item.playCount,
                          width: 126.0,
                          picHeight: 130.0,
                          bottom: 105.0,
                        ),
                      );
                    }).toList(),
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
