import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:play_music/utils/share_preference_class.dart';
import 'package:sizer/sizer.dart';

class Introscreen extends StatefulWidget {
  const Introscreen({Key? key}) : super(key: key);

  @override
  State<Introscreen> createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        initialPage: 0,
        globalBackgroundColor: Colors.black,
        pages: [
          PageViewModel(
              image: Image.asset("assets/image/img1.png"),
              decoration: PageDecoration(
                bodyAlignment: Alignment.center,
                imagePadding: EdgeInsets.only(top: 8.h),
                bodyTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400),
                titleTextStyle: GoogleFonts.mogra(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.sp,
                    color: Colors.green.shade700),
              ),
              title: "Play The Beat",
              body:
                  "Most beginner producers learn make creating by simple beats."),
          PageViewModel(
              image: Image.asset("assets/image/img2.png"),
              decoration: PageDecoration(
                bodyAlignment: Alignment.center,
                imagePadding: EdgeInsets.only(top: 8.h),
                bodyTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400),
                titleTextStyle: GoogleFonts.mogra(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.sp,
                    color: Colors.green.shade700),
              ),
              title: "Live The Life",
              body:
                  "Most beginner producers learn make creating by simple beats."),
          PageViewModel(
              image: Image.asset("assets/image/img3.png"),
              decoration: PageDecoration(
                bodyAlignment: Alignment.center,
                imagePadding: EdgeInsets.only(top: 8.h),
                bodyTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400),
                titleTextStyle: GoogleFonts.mogra(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.sp,
                    color: Colors.green.shade700),
              ),
              title: "Capture The Moment",
              body:
                  "Most beginner producers learn make creating by simple beats."),
        ],
        dotsDecorator: DotsDecorator(
            color: Colors.grey,
            activeSize: Size(2.h, 2.h),
            activeColor: Colors.green.shade700,
            spacing: EdgeInsets.all(2)),
        autoScrollDuration: 3,
        done: Text("Done",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp)),
        showDoneButton: true,
        onDone: () {
          Sharepre share = Sharepre();
          share.for_introscreen();
          Navigator.pushReplacementNamed(context, 'dash');
        },
        next: Container(
            width: 20.w,
            height: 5.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.green.shade700, shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )),
        showNextButton: true,
        skip: Text("Skip",
            style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500)),
        showSkipButton: true,
        onSkip: () {
          Navigator.pushReplacementNamed(context, 'dash');
        },
      ),
    );
  }
}
