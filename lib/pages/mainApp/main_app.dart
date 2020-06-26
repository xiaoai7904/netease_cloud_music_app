import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/pages/accountPage/account_page.dart';
import 'package:netease_cloud_music_app/pages/findPage/find_page.dart';
import 'package:netease_cloud_music_app/pages/myPage/my_page.dart';
import 'package:netease_cloud_music_app/pages/videoPage/video_page.dart';
import 'package:netease_cloud_music_app/pages/yuncunPage/yuncun_page.dart';
import 'package:netease_cloud_music_app/utils/utils.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectIndex = 0;
  PageController _pageController = new PageController(initialPage: 0);

  static List<Widget> _getWidget(context) {
    return <Widget>[FindPage(), VideoPage(), MyPage(), YuncunPage(), AccountPage()];
  }

  // static List<Widget> _widgetOptions = <Widget>[FindPage(), VideoPage(), MyPage(), YuncunPage(), AccountPage()];
  // static List<IconData> _icons = <IconData>[Icons.mic_none, Icons.videocam, Icons.cloud_queue, Icons.person_outline, Icons.crop_free];

  void _navigateTap(int index) {
    setState(() {
      _selectIndex = index;
    });
    _pageController.jumpToPage(index);
    // _pageController.animateToPage(index, duration: Duration(seconds: 1), curve: ElasticInOutCurve());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _getWidget(context),
        physics: NeverScrollableScrollPhysics(), //PageView 可以设置禁止滑动 如果 pagview 嵌套 pagview 会因为滑动冲突导致父pageView无法滑动
        onPageChanged: (index) {
          setState(() {
            this._selectIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            title: Text('视频'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            title: Text('我的'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            title: Text('云村'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.account_circle),
            title: Text('账号'),
          ),
        ],
        onTap: _navigateTap,
        currentIndex: _selectIndex,
        selectedItemColor: Utils.hex2Color('#d43c33'),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Utils.hex2Color('#e4e4e4'),
        unselectedItemColor: Utils.hex2Color('#a6a6a6'),
      ),
    );
  }
}
