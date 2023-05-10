import 'package:flutter/material.dart';
import 'package:play_music/provider/music_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'music_play_screen.dart';

class Likescreen extends StatefulWidget {
  const Likescreen({Key? key}) : super(key: key);

  @override
  State<Likescreen> createState() => _LikescreenState();
}

class _LikescreenState extends State<Likescreen> {
  @override
  Widget build(BuildContext context) {
    mt = Provider.of<Musicprovider>(context, listen: true);
    mf = Provider.of<Musicprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Liked Songs",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("${mt!.likelist.length} songs",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green.shade700,
                      radius: 18.sp,
                      child: Icon(Icons.play_arrow_rounded,
                          color: Colors.black, size: 20.sp),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {

                        },
                        leading: Image.network("${mf!.likelist[index].img}",
                            height: 13.w, width: 13.w, fit: BoxFit.fill),
                        title: Text("${mf!.likelist[index].name}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp)),
                        subtitle: Text("${mf!.likelist[index].singer}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp)),
                        trailing:
                            Icon(Icons.more_vert,color: Colors.grey,size: 18.sp),
                      );
                    },
                    itemCount: mt!.likelist.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
