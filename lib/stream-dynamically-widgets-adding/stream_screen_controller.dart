import 'dart:async';

import 'package:get/get.dart';

class StreamScreenController extends GetxController {
  StreamController<List<String>> streamController = StreamController();
  List<String> streams = [];
  // List<String> streamsString() {
  //   // return  streamController.stream;
  // }

  // getString(String s) {
  //   streamController.add('event');
  //   return s;
  // }
}
