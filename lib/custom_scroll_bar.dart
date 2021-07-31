import 'package:flutter/material.dart';

import 'constants.dart';

class CustomScrollBar extends StatefulWidget {
  const CustomScrollBar({
    required this.scrollController,
  });

  final ScrollController scrollController;
  @override
  _CustomScrollBarState createState() => _CustomScrollBarState();
}

class _CustomScrollBarState extends State<CustomScrollBar> {
  /// CustomScrollBarの位置（Y軸）
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
    return Align(
      alignment: Alignment(custom_scroll_bar_alignmentX, _alignmentY),
      child: Container(
        width: custom_scroll_bar_width,
        height: custom_scroll_bar_height,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(custom_scroll_bar_radius),
            ),
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
