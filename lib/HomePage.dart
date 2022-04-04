import 'package:flutter/material.dart';

import 'ContectPage/group.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () => print('按下選單'),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.circle_outlined,
              color: Colors.black,
            ),
            onPressed: () => print('按下搜尋'),
          )
        ],
        backgroundColor: Colors.white,

        bottom: TabBar(

          labelColor: Colors.black,
          controller: _controller,
          tabs: [
            Tab(
              text: 'personal',
            ),
            Tab(
              text: 'groups',
            ),
            Tab(
              text: 'private' ,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text(''),
          groupChat(),
          Text('')
        ],
      ),
    );
  }
}