import 'package:flutter/material.dart';
import 'package:netease_cloud_music_app/entity/playlist_hot_response.dart';

typedef Widget DataWidgetBuilder<T>(BuildContext context, T data);

class SortableView<T> extends StatefulWidget {
  final DataWidgetBuilder<T> itemBuilder;
  final List<T> dataList;

  SortableView(
    this.dataList, {
    @required this.itemBuilder,
  });

  @override
  _SortableViewState createState() => _SortableViewState<T>();
}

class _SortableViewState<T> extends State<SortableView> {
  List<T> _dataList;
  List<T> _copyDataList;
  int _willAcceptIndex = -1;
  final emptyData = {'name': '', 'id': 'empty'};
  bool _showMoveBottomWidget = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _dataList = widget.dataList;
      _copyDataList = widget.dataList;
    });
  }

  List<Widget> _buildChildren() {
    return _dataList.map((item) {
      int i = _dataList.indexOf(item);
      return LongPressDraggable(
        data: i,
        feedback: widget.itemBuilder(context, item),
        childWhenDragging: _showMoveBottomWidget == true
            ? widget.itemBuilder(context, item)
            : Container(
                width: 88,
                child: Text(''),
              ),
        child: DragTarget<int>(
          onWillAccept: (index) {
            print('onWillAccept $index $i');
            bool accept = index != i;
            if (accept) {
              final fromData = _copyDataList[index];
              setState(() {
                _willAcceptIndex = i;
                _copyDataList.removeAt(index);
                _copyDataList.insert(i, fromData);
                _dataList = _copyDataList.sublist(0);
                _showMoveBottomWidget = true;
              });
            }
            return accept;
          },
          onAccept: (index) {
            print('onAccept $index');
            // setState(() {
            //   _willAcceptIndex = -1;
            // });
          },
          onLeave: (index) {
            print('onLeave $index');
            // setState(() {
            //   _willAcceptIndex = -1;
            // });
          },
          builder: (context, data, rejects) {
            return _willAcceptIndex >= 0 && _willAcceptIndex == i ? null : widget.itemBuilder(context, item);
          },
        ),
        onDragStarted: () {
          // print('start');
          _copyDataList = _dataList.sublist(0);
          setState(() {
            _showMoveBottomWidget = false;
          });
        },
        onDragCompleted: () {
          print('completed');
          _copyDataList = _dataList.sublist(0);
          setState(() {
            _willAcceptIndex = -1;
          });
        },
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          print('canceled');
          _copyDataList = _dataList.sublist(0);
          setState(() {
            _willAcceptIndex = -1;
          });
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // 主轴(水平)方向间距
      runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向
      children: _buildChildren(),
    );
  }
}
