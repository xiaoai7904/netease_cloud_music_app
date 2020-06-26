import 'package:flutter/material.dart';
// import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/delivery_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:netease_cloud_music_app/pages/findPage/find_page_banner.dart';
import 'package:netease_cloud_music_app/pages/findPage/find_page_dj_list.dart';
import 'package:netease_cloud_music_app/pages/findPage/find_page_menu.dart';
import 'package:netease_cloud_music_app/pages/findPage/find_page_privatecontent.dart';
import 'package:netease_cloud_music_app/pages/findPage/find_page_song_list.dart';
import 'package:netease_cloud_music_app/pages/findPage/find_page_song_selection.dart';
import 'package:netease_cloud_music_app/store/find_page_model.dart';
import 'package:netease_cloud_music_app/widget/cachedNetworkImage/cached_network_image.dart';
// import 'package:netease_cloud_music_app/widget/sampleListItem/sample_list_item.dart';
import 'package:netease_cloud_music_app/widget/searchBar/search_bar.dart';
import 'package:provider/provider.dart';

// 发现页面
class FindPage extends StatefulWidget {
  final BuildContext parentContext;

  FindPage({Key key, this.parentContext}) : super(key: key);

  @override
  _FindPageState createState() {
    return _FindPageState();
  }
}

class _FindPageState extends State<FindPage> with AutomaticKeepAliveClientMixin {
  // 获取banner
  void _requestBannerList() {
    FindPageModel.requestBannerList(context: context);
  }

  // 获取推荐歌单
  void _requestPersonalizedList() {
    FindPageModel.requestPersonalized(context: context);
  }

  // 获取推荐歌曲
  void _requestPersonalizedSongList() {
    FindPageModel.requestPersonalizedSong(context: context);
  }

  // 获取推荐电台
  void _requestPersonalizedDjList() {
    FindPageModel.requestPersonalizedDj(context: context);
  }

  // 获取独家推送
  void _requestPersonalizedPrivatecontentList() {
    FindPageModel.requestPersonalizedPrivatecontent(context: context);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _requestBannerList();
    _requestPersonalizedList();
    _requestPersonalizedSongList();
    _requestPersonalizedDjList();
    _requestPersonalizedPrivatecontentList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(headerIcon: Icons.mic_none),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: EasyRefresh.custom(
        header: DeliveryHeader(
          backgroundColor: Colors.grey[100],
        ),
        // footer: BallPulseFooter(),
        onRefresh: () async {
          _requestBannerList();
          _requestPersonalizedList();
          _requestPersonalizedSongList();
          _requestPersonalizedDjList();
          _requestPersonalizedPrivatecontentList();
          // await Future.delayed(Duration(seconds: 2), () {
          //   if (mounted) {
          //     setState(() {
          //       _count = 20;
          //     });
          //   }
          // });
        },
        // onLoad: () async {
        //   await Future.delayed(Duration(seconds: 2), () {
        //     if (mounted && _count <= 40) {
        //       // setState(() {
        //       //   _count += 20;
        //       // });
        //     }
        //   });
        // },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Consumer<FindPageModel>(builder: (context, FindPageModel findPageModel, child) {
                  if (findPageModel.banners.isEmpty) {
                    return CachedNetworkImageWidget(
                      imageUrl: '',
                      height: 170.0,
                    );
                  }
                  return FindPageBanner(
                    banners: findPageModel.banners,
                  );
                });
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return FindPageMenu();
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Consumer<FindPageModel>(builder: (context, FindPageModel findPageModel, child) {
                  return FindPageSongList(personalized: findPageModel.personalized, parentContext: widget.parentContext);
                });
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Consumer<FindPageModel>(builder: (context, FindPageModel findPageModel, child) {
                  return FindPageSongSelection(
                    convertPersonalizedSong: findPageModel.convertPersonalizedSong,
                  );
                });
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Consumer<FindPageModel>(builder: (context, FindPageModel findPageModel, child) {
                  return FindPageDjList(
                    personalizedDj: findPageModel.personalizedDj,
                  );
                });
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Consumer<FindPageModel>(builder: (context, FindPageModel findPageModel, child) {
                  return FindPagePrivatecontentList(
                    personalizedPrivatecontent: findPageModel.personalizedPrivatecontent,
                  );
                });
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
