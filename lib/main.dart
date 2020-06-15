import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/api/api.dart';
import 'package:netease_cloud_music_app/pages/mainApp/main_app.dart';
import 'package:netease_cloud_music_app/router/application.dart';
import 'package:netease_cloud_music_app/router/router.dart';
import 'package:netease_cloud_music_app/store/find_page_model.dart';
import 'package:netease_cloud_music_app/utils/request_utils.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router();

    Routes.configRouter(router);
    Application.router = router;
    RequestUtil.init(Api.baseUrl);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FindPageModel>(create: (context) => FindPageModel()),
      ],
      child: MaterialApp(
        title: 'NeteaseCloudMusicApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainApp(),
      ),
    );
  }
}
