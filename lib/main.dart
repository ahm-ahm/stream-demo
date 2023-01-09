import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_demo/custom-stream/broadcast_stream_screen.dart';
import 'package:stream_demo/stream-dynamically-widgets-adding/dynamic_stream_screen.dart';

import 'custom-stream/single_subscription_stream_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DynamicStreamScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  StreamController? _streamController;
  getStream() {
    _streamController!.sink.add(_counter++);
  }

  @override
  void initState() {
    _streamController = StreamController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
                stream: _streamController?.stream,
                builder: (context, asyncSnapshot) {
                  return Text(
                    '${asyncSnapshot.data ?? 0}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getStream,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
