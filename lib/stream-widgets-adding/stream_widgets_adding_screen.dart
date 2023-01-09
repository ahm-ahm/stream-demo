import 'dart:async';

import 'package:flutter/material.dart';

class StreamWidgetsAddingScreen extends StatefulWidget {
  const StreamWidgetsAddingScreen({Key? key}) : super(key: key);

  @override
  State<StreamWidgetsAddingScreen> createState() =>
      _StreamWidgetsAddingScreenState();
}

class _StreamWidgetsAddingScreenState extends State<StreamWidgetsAddingScreen> {
  final StreamController<> _controller = StreamController();
  int c = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Widget>(
          initialData: const Center(child: Text('no data')),
          stream: _controller.stream,
          builder: (_, snapshot) {
            // return ListView.builder(
            //   itemCount: snapshot.l,
            //   itemBuilder: (_, index) {
            return snapshot.data!;
            // },
            // );
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _controller.sink.add(Card(child: Text('Hello $c time')));
        c++;
      }),
    );
  }

  widgets(Widget widget) async* {
    _controller.add(widget);
  }
}
