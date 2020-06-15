import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/utils/color_utils.dart';
import 'package:netease_cloud_music_app/widget/hidden/hidden.dart';

// appBar搜索组件
class SearchBar extends StatefulWidget {
  SearchBar({Key key, this.headerIcon, this.headerIconColor, this.showSearch, this.showTabs, this.tabs}) : super(key: key);

  final IconData headerIcon;
  final Color headerIconColor;
  final bool showSearch;
  final bool showTabs;
  final Widget tabs;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FocusNode focusNode = new FocusNode();
  final TapGestureRecognizer recognizer = TapGestureRecognizer();

  bool isFocus = false;
  Widget _currentWidget;

  Color _f1f1f1Color = ColorUtils.hex2Color('#f1f1f1');
  Color _color89 = ColorUtils.hex2Color('#898989');
  Color _color333 = ColorUtils.hex2Color('#333333');

  @override
  void initState() {
    recognizer.onTap = () {
      focusNode.unfocus();
      _currentWidget = createSearchTapView();
    };
    focusNode.addListener(() {
      setState(() {
        isFocus = focusNode.hasFocus;
      });
    });
    _currentWidget = createSearchTapView();

    super.initState();
  }

  Widget createTextField() {
    return TextField(
      key: ValueKey("1"),
      focusNode: focusNode,
      autofocus: isFocus,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 1.0),
        hintText: "不能说的密码-周杰伦",
        hintStyle: TextStyle(fontSize: 13.0),
        fillColor: _f1f1f1Color,
        prefixIcon: Icon(
          Icons.search,
          color: _color89,
          size: 16,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: _f1f1f1Color, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: _f1f1f1Color, width: 0.0),
        ),
      ),
    );
  }

  Widget createSearchTapView() {
    if (widget.showTabs == true) {
      return widget.tabs;
    }
    if (widget.showSearch == false) {
      return Opacity(opacity: 0, child: createTapView());
    }

    return GestureDetector(
      key: ValueKey("2"),
      child: createTapView(),
      onTap: () {
        setState(() {
          isFocus = true;
          _currentWidget = createTextField();
        });
      },
    );
  }

  Widget createTapView() {
    return Container(
      decoration: BoxDecoration(
        color: _f1f1f1Color,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.search,
            color: _color89,
            size: 16,
          ),
          Text(
            '不能说的密码-周杰伦',
            style: TextStyle(fontSize: 13, color: _color89),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          isFocus == true
              ? Hidden()
              : Icon(
                  widget.headerIcon,
                  color: widget.headerIconColor != null ? widget.headerIconColor : _color89,
                ),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 900),
              child: Container(
                height: 35.0,
                padding: isFocus == true ? EdgeInsets.only(right: 10.0) : EdgeInsets.only(left: 15.0, right: 15.0),
                child: _currentWidget,
              ),
              transitionBuilder: (Widget child, Animation<double> animation) {
                var tween = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0));
                return SlideTransition(
                  child: child,
                  position: tween.animate(animation),
                );
              },
            ),
          ),
          isFocus == true
              ? RichText(
                  text: TextSpan(text: '取消', style: TextStyle(color: _color333, fontSize: 15.0), recognizer: recognizer),
                )
              : Hidden(),
          isFocus == true
              ? Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.account_circle,
                    color: _color89,
                    size: 26,
                  ),
                )
              : ClipOval(child: Image.asset('assets/logo.png', width: 30.0)),
        ],
      ),
    );
  }
}
