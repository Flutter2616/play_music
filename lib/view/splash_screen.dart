import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:play_music/provider/music_provider.dart';
import 'package:play_music/utils/share_preference_class.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool? status;
  @override
  void initState() {
    super.initState();
    getintrostatus();
  }

  Future<void> getintrostatus()
  async {
    Sharepre share=Sharepre();
    status=await share.for_introscreen_status();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4),() {
      status == true?
             Navigator.pushReplacementNamed(context, 'dash')
          :Navigator.pushReplacementNamed(context, 'intro');
    },);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Image.network(
                "https://i.pinimg.com/originals/6f/c7/f0/6fc7f083d9254aca54b379d004fb0b0e.jpg",
                width: 100.w,
                height: 100.h,
                fit: BoxFit.cover),
            Container(height: 100.h,width: 100.w,color: Color(0xB3000000)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/image/logo.png",
                      height: 20.h, width: 20.h, fit: BoxFit.cover),
                  SizedBox(height: 5),
                  Text(
                    "Music Beats",
                    style: GoogleFonts.indieFlower(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
