import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play_music/provider/music_provider.dart';
import 'package:play_music/view/home_screen.dart';
import 'package:play_music/view/like_screen.dart';
import 'package:play_music/view/music_play_screen.dart';
import 'package:play_music/view/search_screen.dart';
import 'package:play_music/view/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'view/dash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Colors.black,statusBarColor: Colors.black));
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => Musicprovider()),
          ],
          child: MaterialApp(
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => Splashscreen(),
              'home': (context) => Homescreen(),
              'search':(context) => Searchscreen(),
              'playscreen': (context) => Playscreen(),
              'dash': (context) => Dashscreen(),
              'like':(context) => Likescreen(),
            },
          ),
        );
      },
    ),
  );
}
