import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:netease_cloud_music_app/entity/banner_response.dart';
import 'package:netease_cloud_music_app/widget/cachedNetworkImage/cached_network_image.dart';
import 'package:netease_cloud_music_app/widget/webview/page_web_view.dart';

class FindPageBanner extends StatelessWidget {
  final List<BannerResponse> banners;
  final Map<String, Color> _titleColors = {'red': Colors.red, 'blue': Colors.blue};
  FindPageBanner({Key key, this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
      child: Swiper(
        autoplay: true,
        itemCount: banners.length <= 0 ? 1 : banners.length,
        autoplayDelay: 5000,
        duration: 1000,
        pagination: new SwiperPagination(builder: CustomPageination()),
        onTap: (int index) {
          if (banners[index].url == null) {
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PageWebView(
                    webViewUrl: banners[index].url,
                  );
                },
              ),
            );
          }
        },
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImageWidget(
                      imageUrl: banners.elementAt(index)?.pic ?? '',
                      height: 170.0,
                    ) //Image.asset('assets/bj.jpg', fit: BoxFit.cover),
                    ),
              ),
              Positioned(
                child: UnconstrainedBox(
                  child: Container(
                    padding: EdgeInsets.only(top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                    decoration: BoxDecoration(
                      color: banners.isNotEmpty ? _titleColors[banners.elementAt(index).titleColor] : Colors.red,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0)),
                    ),
                    child: Text(
                      banners.isNotEmpty ? banners.elementAt(index).typeTitle : '',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                right: 10.0,
                bottom: 10.0,
              )
            ],
          );
        },
      ),
    );
  }
}

class CustomPageination extends DotSwiperPaginationBuilder {
  ///color when current index,if set null , will be Theme.of(context).primaryColor
  final Color activeColor;

  ///,if set null , will be Theme.of(context).scaffoldBackgroundColor
  final Color color;

  ///Size of the dot when activate
  final double activeSize;

  ///Size of the dot
  final double size;

  /// Space between dots
  final double space;

  final Key key;

  const CustomPageination({this.activeColor: Colors.red, this.color, this.key, this.size: 5.0, this.activeSize: 5.0, this.space: 3.0}) : super(key: key);
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return super.build(context, config);
  }
}
