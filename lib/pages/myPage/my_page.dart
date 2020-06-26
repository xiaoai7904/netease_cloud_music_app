import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netease_cloud_music_app/widget/flexibleDetailBar/flexible_detail_bar.dart';
import 'package:netease_cloud_music_app/widget/searchBar/search_bar.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin{
  static final double _initialToolbarHeight = 300;
  static final double _maxSizeFactor = 1.3; // image max size will 130%
  static final double _transformSpeed = 0.001; // 0.1 very fast,   0.001 slow

  ScrollController _controller;
  double _factor = 1;
  double _expandedToolbarHeight = _initialToolbarHeight;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  _scrollListener() {
    if (_controller.offset < 0) {
      _factor = 1 + _controller.offset.abs() * _transformSpeed;
      _factor = _factor.clamp(1, _maxSizeFactor);
      _expandedToolbarHeight = _initialToolbarHeight + _controller.offset.abs();
    } else {
      _factor = 1;
      _expandedToolbarHeight = _initialToolbarHeight; //
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        slivers: <Widget>[
          // SliverAppBar(
          //   title: SearchBar(headerIcon: Icons.cloud_queue, headerIconColor: Colors.white, showSearch: false),
          //   pinned: true,
          //   expandedHeight: 250.0,
          //   flexibleSpace: FlexibleDetailBar(
          //     content: Container(),
          //     background: Image.asset('assets/bj.jpg', fit: BoxFit.cover),
          //   ),
          // ),
          SliverPersistentHeader(
            floating: false,
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 80,
              maxHeight: _expandedToolbarHeight,
              child: Transform.scale(
                scale: _factor,
                child: Image.asset('assets/bj.jpg', fit: BoxFit.cover),
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              //创建列表项
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[900 - 100 * (index % 9)],
                child: Text('list item $index'),
              );
            }, childCount: 50 //50个列表项
                ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double top = -180 + (210 * (shrinkOffset) / 180);
    return Stack(
      children: <Widget>[
        SizedBox.expand(child: child),
        Positioned(
          child: SearchBar(headerIcon: Icons.cloud_queue, headerIconColor: Colors.white, showSearch: false),
          top: top > 30 ? 30 : top,
          left: 15.0,
          right: 15.0,
          bottom: 0.0,
        ),
      ],
    );
    // return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
