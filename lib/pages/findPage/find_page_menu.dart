import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/utils/color_utils.dart';

class FindPageMenu extends StatelessWidget {

  final int _currentDay = new DateTime.now().day - 20;
  final Color _colorf6f6f6 = ColorUtils.hex2Color('#6f6f6f');

  String _getCurrentDay() => '${_currentDay < 10 ? '0' : ''}$_currentDay';

  Widget _createMenuItemIcon(String url) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 5.0),
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: ClipRRect(
        child: Image.asset(url, fit: BoxFit.cover),
      ),
    );
  }

  Widget _createMenuItemText(String name) {
    return Text(
      name,
      style: TextStyle(fontSize: 13, color: _colorf6f6f6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      _createMenuItemIcon('assets/calendar.png'),
                      Positioned(
                        child: Text(
                          _getCurrentDay(),
                          style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        top: 19.0,
                        left: 16.0,
                        right: 10.0,
                        bottom: 10.0,
                      )
                    ],
                  ),
                  _createMenuItemText('每日推荐')
                ],
              ),
              onTap: () {},
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Column(
                children: <Widget>[_createMenuItemIcon('assets/song.png'), _createMenuItemText('歌单')],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Column(
                children: <Widget>[_createMenuItemIcon('assets/leaderboard.png'), _createMenuItemText('排行榜')],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Column(
                children: <Widget>[_createMenuItemIcon('assets/radio.png'), _createMenuItemText('电台')],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Column(
                children: <Widget>[_createMenuItemIcon('assets/live.png'), _createMenuItemText('直播')],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
