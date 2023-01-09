import 'dart:async';

import 'package:flutter/material.dart';

class BroadcastStreamScreen extends StatefulWidget {
  const BroadcastStreamScreen({Key? key}) : super(key: key);

  @override
  State<BroadcastStreamScreen> createState() => _BroadcastStreamScreenState();
}

class _BroadcastStreamScreenState extends State<BroadcastStreamScreen> {
  late StreamController streamController;
  late Stream broadcastStream;
  @override
  void initState() {
    getValue();
    getValue();
    super.initState();
  }

  int value = 0;
  getValue() {
    streamController = StreamController();
    broadcastStream = streamController.stream.asBroadcastStream();
    streamController.add(++value);

    broadcastStream.listen((event) {
      // value = event;
      print('value---$event---$value');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text('$value'))),
      floatingActionButton: FloatingActionButton(
        onPressed: getValue,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
