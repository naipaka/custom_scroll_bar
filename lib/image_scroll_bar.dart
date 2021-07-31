import 'package:flutter/material.dart';

import 'constants.dart';

class ImageScrollBar extends StatefulWidget {
  const ImageScrollBar({
    required this.scrollController,
  });

  final ScrollController scrollController;
  @override
  _ImageScrollBarState createState() => _ImageScrollBarState();
}

class _ImageScrollBarState extends State<ImageScrollBar> {
  /// ImageScrollBarの位置（Y軸）
  /// topが-1.0、bottomが1.0
  double _alignmentY = custom_scroll_bar_alignmentY;

  @override
  void initState() {
    // スクロールの動きを検知するリスナーを設定
    widget.scrollController.addListener(_scrollingListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40),
      child: Align(
        alignment: Alignment(custom_scroll_bar_alignmentX, _alignmentY),
        child: ClipOval(
          child: Image.asset(
            'assets/images/naipaka.png',
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }

  /// スクロールの動きを検知する
  void _scrollingListener() {
    setState(() {
      // スクロール位置
      final position = widget.scrollController.position;
      // スクロール領域に対する現在の位置の比率
      final ratio = position.pixels / position.maxScrollExtent;
      // スクロール位置に対するScrollBarのAlignmentを設定
      _alignmentY = ratio * 2 - 1;
    });
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }
}
