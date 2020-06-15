import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/widget/searchBar/search_bar.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(headerIcon: Icons.crop_free, showSearch: false,),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(),
    );
  }
}