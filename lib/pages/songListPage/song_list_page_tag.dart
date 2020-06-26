import 'package:flutter/material.dart';

// 歌单广场标签编辑页面
class SongListPageTag extends StatefulWidget {
  @override
  _SongListPageTagState createState() => _SongListPageTagState();
}

class _SongListPageTagState extends State<SongListPageTag> {
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('歌单标签'),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: Row(
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
                  borderSide: new BorderSide(color: Colors.red),
                  // padding: EdgeInsets.only(left: 5.0),
                  onPressed: () {
                    setState(() {
                      isEdit = !isEdit;
                    });
                  },
                ),
              )
              // FlatButton(
              //   color: Colors.white,
              //   textColor: Colors.red,
              //   highlightColor: Colors.red,
              //   child: Text(isEdit == true ? '完成' : '编辑', style: TextStyle(fontSize: 14),),
              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              //   onPressed: () {
              //     setState(() {
              //       isEdit = !isEdit;
              //     });
              //   },
              // )
            ],
          ),
        ));
  }
}
