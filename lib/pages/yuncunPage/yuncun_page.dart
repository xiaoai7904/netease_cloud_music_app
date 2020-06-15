import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/widget/searchBar/search_bar.dart';

class YuncunPage extends StatefulWidget {
  @override
  _YuncunPageState createState() => _YuncunPageState();
}

class _YuncunPageState extends State<YuncunPage> with AutomaticKeepAliveClientMixin{
  TabController _controller;
  final List<String> _tabValues = [
    '广场',
    '关注',
  ];

  @override
  void initState() {
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  
  Widget createTabs() {
    return TabBar(
      tabs: _tabValues.map((f) {
        return Text(f);
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(headerIcon: Icons.person_outline, showSearch: false, showTabs: true, tabs: createTabs()),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: TabBarView(
          controller: _controller,
          children: <Widget>[
            Center(
              child: Text('广场'),
            ),
            Center(
              child: Text('关注'),
            ),
          ],
        ),
      ),
    );
  }
}
