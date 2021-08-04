import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => new _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  ScrollController controller = ScrollController();
  List<String> items = new List.generate(100, (index) => 'Hello $index');

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Scrollbar(
        child: new ListView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            return new Text(items[index]);
          },
          itemCount: items.length,
        ),
      ),
    );
  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 500) {
      setState(() {
        items.addAll(new List.generate(42, (index) => 'Inserted $index'));
      });
    }
  }
}
