import 'package:flutter/material.dart';

import 'constants.dart';
import 'custom_scroll_bar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          ListView.builder(
            controller: scrollController,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100,
                color: colors[index % colors.length],
              );
            },
            itemCount: 10,
          ),
          CustomScrollBar(
            scrollController: scrollController,
          ),
          // ImageScrollBar(
          //   scrollController: scrollController,
          // ),
        ],
      ),
    );
  }
}
