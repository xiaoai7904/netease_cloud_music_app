import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:netease_cloud_music_app/entity/personalized_privatecontent_response.dart';
import 'package:netease_cloud_music_app/widget/horizontalList/horizontal_list.dart';

class FindPagePrivatecontentList extends StatelessWidget {
  final List<PersonalizedPrivatecontentResponse> personalizedPrivatecontent;

  FindPagePrivatecontentList({Key key, this.personalizedPrivatecontent}) : super(key: key);

  // List<Widget> _createItem() {
  //   return personalizedPrivatecontent
  //       .map((item) => HorizontalList(
  //             picUrl: item.sPicUrl,
  //             name: item.name,
  //             playCount: '',
  //             width: 350.0,
  //             height: 250.0,
  //             picHeight: 190.0,
  //           ))
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    if (personalizedPrivatecontent.length == 0) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('独家推送', style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Container(
            height: 250.0,
            child: Swiper(
              loop: false,
              itemCount: personalizedPrivatecontent.length,
              autoplayDelay: 5000,
              viewportFraction: 0.9,
              duration: 1000,
              onTap: (int index) {},
              itemBuilder: (BuildContext context, int index) {
                return HorizontalList(
                  picUrl: personalizedPrivatecontent[index].sPicUrl,
                  name: personalizedPrivatecontent[index].name,
                  playCount: 0,
                  width: 350.0,
                  height: 250.0,
                  picHeight: 190.0,
                );
              },
            ),
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: _createItem(),
          //   ),
          // )
        ],
      ),
    );
  }
}
