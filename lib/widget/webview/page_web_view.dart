import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:netease_cloud_music_app/widget/pageLoading/page_loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageWebView extends StatefulWidget {
  final String webViewUrl;

  PageWebView({Key key, this.webViewUrl}) : super(key: key);

  @override
  _PageWebViewState createState() => _PageWebViewState();
}

class _PageWebViewState extends State<PageWebView> {
  WebViewController _controller;

  String _title = '';
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: TextStyle(fontSize: 16)),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: widget.webViewUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
            navigationDelegate: (NavigationRequest request) {
              String _url = request.url;
              print('请求页面地址:$_url');
              print('当前页面地址:${widget.webViewUrl}');
              // if (_url == widget.webViewUrl) {
              setState(() {
                isLoading = true;
              });
              return NavigationDecision.navigate;
              // }
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return PageWebView(
              //         webViewUrl: _url,
              //       );
              //     },
              //   ),
              // );
              // return NavigationDecision.prevent;
            },
            onPageStarted: (String url) {
              print('页面请求开始:$url');
            },
            onPageFinished: (String url) {
              print('页面请求完成:$url');
              setState(() {
                isLoading = false;
              });
              _controller.evaluateJavascript("document.title").then((result) {
                setState(() {
                  _title = result;
                });
              });
            },
            onWebResourceError: (error) {
              print('页面请求错误: $error');
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading == true
              ? Container(
                  child: PageLoading(),
                )
              : Container(),
        ],
      ),
    );
  }
}
