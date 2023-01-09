import 'dart:async';

import 'package:flutter/material.dart';

class SingleSubscriptionStreamScreen extends StatefulWidget {
  const SingleSubscriptionStreamScreen({Key? key}) : super(key: key);

  @override
  State<SingleSubscriptionStreamScreen> createState() =>
      _SingleSubscriptionStreamScreenState();
}

class _SingleSubscriptionStreamScreenState
    extends State<SingleSubscriptionStreamScreen> {
  late StreamController streamController;
  late Stream singleSubscription;
  @override
  void initState() {
    getValue();
    super.initState();
  }

  int value = 0;
  getValue() {
    streamController = StreamController();
    singleSubscription = streamController.stream;
    streamController.add(++value);

    singleSubscription.listen((event) {
      // value = event;
      print('value---$event---$value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text('$value'))),
    );
  }
}
