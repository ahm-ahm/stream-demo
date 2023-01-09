import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_demo/stream-dynamically-widgets-adding/stream_screen_controller.dart';

class DynamicStreamScreen extends StatefulWidget {
  const DynamicStreamScreen({Key? key}) : super(key: key);

  @override
  State<DynamicStreamScreen> createState() => _DynamicStreamScreenState();
}

class _DynamicStreamScreenState extends State<DynamicStreamScreen> {
  List<String> l = [];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StreamScreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: StreamBuilder(
          stream: controller.streamController.stream,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              final list = snapshot.data as List<String>;
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    return Card(
                      child: ListTile(
                          title: Text(list[index]),
                          subtitle: Text('Description here of index:$index'),
                          leading: Text(index.toString())),
                    );
                  });
            } else if (snapshot.hasError) {
              Center(child: Text(snapshot.error.toString()));
            }
            return const Center(child: CircularProgressIndicator());
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          l.add('value');
          controller.streamController.add(l);
          // setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
