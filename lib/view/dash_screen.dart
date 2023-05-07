import 'package:flutter/material.dart';
import 'package:play_music/provider/music_provider.dart';
import 'package:play_music/view/home_screen.dart';
import 'package:play_music/view/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'music_play_screen.dart';

class Dashscreen extends StatefulWidget {
  const Dashscreen({Key? key}) : super(key: key);

  @override
  State<Dashscreen> createState() => _DashscreenState();
}

class _DashscreenState extends State<Dashscreen> {
  @override
  Widget build(BuildContext context) {
    mt = Provider.of<Musicprovider>(context, listen: true);
    mf = Provider.of<Musicprovider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xb6000000),
        elevation: 0,
        iconSize: 20.sp,
        selectedItemColor: Colors.green.shade700,
        unselectedItemColor: Colors.white,onTap: (value) {
          mf!.bottomnavigation(value);
        },currentIndex: mt!.pageindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_search),
              label: "Search",
              activeIcon: Icon(Icons.manage_search)),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Like",
              activeIcon: Icon(Icons.favorite)),
        ],
      ),
      body: IndexedStack(
        index: mt!.pageindex,
        children: [
          Homescreen(),
          Searchscreen(),
        ],
      ),
    );
  }
}
