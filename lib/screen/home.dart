import 'package:flutter/material.dart';
import 'package:flutter_solodroid/helper/screen_orientation.dart';
import 'package:flutter_solodroid/widget/custom_list_drawer.dart';

import 'category_index.dart';
import 'favorite_posts.dart';
import 'video_posts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TabController _tabController;
  DateTime currentBackPressTime;
  int _currentTab = 0;
  final List<Widget> _listTabs = [
    VideoPosts(),
    CategoryPosts(),
    FavoritePosts()
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _listTabs.length);
    Screen.setPortrait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drakor Indo Pro'),
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: TabBarView(
        children: _listTabs,
        controller: _tabController,
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      drawer: _drawer(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (index) {
          setState(() {
            _currentTab = index;
            _tabController.animateTo(_currentTab);
          });
        },
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video), title: Text("New")),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), title: Text("Channels")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("Favorite")),
        ]);
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            color: Colors.red,
            padding: EdgeInsets.only(top: 50, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    "assets/images/iconku.jpg",
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Drakor Indo Pro",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'support@ayahsujana.com',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                ButtonDrawerList(
                    onTap: null,
                    icon: Icons.local_activity,
                    dTitle: "Rate App"),
                ButtonDrawerList(
                    onTap: null, icon: Icons.screen_share, dTitle: "Share App"),
                ButtonDrawerList(
                    onTap: null, icon: Icons.more, dTitle: "More App"),
                ButtonDrawerList(
                    onTap: null, icon: Icons.security, dTitle: "Privacy"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
