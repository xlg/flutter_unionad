import 'package:flutter/material.dart';
///
class PageTest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PageTestState();
  }

}

class _PageTestState extends State<PageTest>{
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("标题"),),
      body: Column(
        children: [
          Expanded(child: SizedBox()),
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
            child: Text("测试"),
          )

        ],
      ),
    );
  }
}