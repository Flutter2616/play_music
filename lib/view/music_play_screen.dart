import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/music_provider.dart';

Musicprovider? mt;
Musicprovider? mf;

class Playscreen extends StatefulWidget {
  const Playscreen({Key? key}) : super(key: key);

  @override
  State<Playscreen> createState() => _PlayscreenState();
}

class _PlayscreenState extends State<Playscreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Musicprovider>(context, listen: false).intimusic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mf = Provider.of<Musicprovider>(context, listen: false);
    mt = Provider.of<Musicprovider>(context, listen: true);
    int i = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              child: Image.network("${mf!.songlist[mt!.musicindex].img}",
                  fit: BoxFit.cover),
            ),
            Container(
              color: Color(0xB6000000),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "Dashscreen",
                              arguments: i);
                          mf!.stopsong();
                        },
                        child: Icon(Icons.keyboard_arrow_down,
                            color: Colors.white, size: 20.sp),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("PLAYING FROM PLAYLIST",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 9.sp)),
                          Text("Songlist",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 8.sp)),
                        ],
                      ),
                      PopupMenuButton(
                        color: Colors.white,
                        iconSize: 20.sp,
                        itemBuilder: (context) {
                          return <PopupMenuEntry>[
                            PopupMenuItem(child: Text("pop menu")),
                          ];
                        },
                      )
                    ],
                  ),
                  Container(
                    height: 40.h,
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    width: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              "${mf!.songlist[mt!.musicindex].img}"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${mt!.songlist[mt!.musicindex].name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 15.sp),
                                ),
                                Text(
                                  "${mf!.songlist[mt!.musicindex].singer}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                      fontSize: 10.sp),
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  mf!.songlike(i);
                                },
                                icon: Icon(
                                  mt!.songlist[i].like == false
                                      ? Icons.favorite_border
                                      : Icons.favorite,
                                  color: Colors.green.shade500,
                                  size: 25,
                                ))
                          ],
                        ),
                        PlayerBuilder.currentPosition(
                          player: mf!.assetsAudioPlayer,
                          builder: (context, position) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Slider(
                                    value: position.inSeconds.toDouble(),
                                    onChanged: (value) {
                                      position =
                                          Duration(seconds: value.toInt());
                                      mf!.assetsAudioPlayer.seek(position);
                                    },
                                    max: mt!.musicDuration.inSeconds.toDouble(),
                                    activeColor: Colors.green.shade700,
                                    inactiveColor: Colors.grey.shade500,
                                    thumbColor: Colors.white),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${position}",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white)),
                                    Text("${mt!.musicDuration}",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white)),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.shuffle,
                                    color: Colors.white, size: 20.sp)),
                            IconButton(
                                onPressed: () {
                                  mf!.presong();
                                },
                                icon: Icon(Icons.skip_previous,
                                    color: Colors.white, size: 20.sp)),
                            FloatingActionButton(
                                onPressed: () {
                                  if (mt!.assetsAudioPlayer.isPlaying.value) {
                                    mf!.stopsong();
                                  } else {
                                    mf!.playsong();
                                  }
                                },
                                child: Icon(
                                    mt!.playmusic
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    size: 20.sp,
                                    color: Colors.white),
                                backgroundColor: Colors.green.shade700),
                            IconButton(
                                onPressed: () {
                                  mf!.nextsong();
                                },
                                icon: Icon(Icons.skip_next,
                                    color: Colors.white, size: 20.sp)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.repeat,
                                    color: Colors.white, size: 20.sp)),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.speaker_group_outlined,
                                size: 18.sp, color: Colors.white),
                            Spacer(),
                            Icon(Icons.share, color: Colors.white, size: 15.sp),
                            SizedBox(width: 10),
                            Icon(Icons.menu, color: Colors.white, size: 15.sp),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
