import 'package:flutter/material.dart';
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
              print(_url);
              print(widget.webViewUrl);
              if (_url == widget.webViewUrl) {
                setState(() {
                  isLoading = true;
                });
                return NavigationDecision.navigate;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PageWebView(
                      webViewUrl: _url,
                    );
                  },
                ),
              );
              return NavigationDecision.prevent;
            },
            onPageFinished: (String url) {
              _controller.evaluateJavascript("document.title").then((result) {
                setState(() {
                  _title = result;
                  isLoading = false;
                });
              });
            },
          ),
          isLoading == true
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
