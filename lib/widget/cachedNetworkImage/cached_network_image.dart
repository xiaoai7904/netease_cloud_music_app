import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/widget/pageLoading/page_loading.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  CachedNetworkImageWidget({
    Key key,
    this.imageUrl = 'https://lh3.googleusercontent.com/w8LJc8iys4bEEy4s3ygwv0kkH5LBE6EcsMPDb2U9Pwl0j3-W1kdeALM1ONo0pmryS0I',
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        child: PageLoading(
          width: 20.0,
          height: 20.0,
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        'assets/none.png',
        fit: BoxFit.contain,
        width: width,
        height: height,
      ),
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}
