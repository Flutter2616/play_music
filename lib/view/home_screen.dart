import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:play_music/provider/music_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Musicprovider? mt;
  Musicprovider? mf;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Provider.of<Musicprovider>(context, listen: false).intimusic();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    mt = Provider.of<Musicprovider>(context, listen: true);
    mf = Provider.of<Musicprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Good evening",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Icon(Icons.notifications_none_sharp,
                      size: 18.sp, color: Colors.white),
                  SizedBox(width: 15),
                  Icon(Icons.av_timer_rounded,
                      size: 18.sp, color: Colors.white),
                  SizedBox(width: 15),
                  Icon(Icons.settings_outlined,
                      size: 18.sp, color: Colors.white),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  songtype("Music"),
                  SizedBox(width: 15),
                  songtype("Podcasts & Shows"),
                ],
              ),
              SizedBox(height: 20),
              Divider(height: 2, thickness: 2, color: Colors.green.shade200),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                         mf!.musicindexpass(index);
                          Navigator.pushNamed(context, "playscreen",
                              arguments: index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          height: 8.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                              color: Color(0x5E8D8989)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 100.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.sp)),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${mf!.songlist[index].img}"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${mf!.songlist[index].name}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp),
                                  ),
                                  Text(
                                    "${mf!.songlist[index].singer}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp),
                                  ),
                                ],
                                mainAxisSize: MainAxisSize.min,
                              ),
                              Spacer(),
                              Icon(Icons.play_arrow_rounded,
                                  size: 20.sp, color: Colors.green.shade700),
                              SizedBox(width: 15),
                            ],
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: mt!.songlist.length),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container songtype(String title) {
    return Container(
      height: 4.h,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color:Colors.green.shade600,
        color: Color(0x478D8989),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Text("$title",
          style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontSize: 10.sp)),
    );
  }
}
