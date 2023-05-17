import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              height: 50.h,
              width: 100.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60.sp),
                      bottomLeft: Radius.circular(60.sp))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      "assets/image/logo1.png",width: 60.w,height: 10.h,fit: BoxFit.fill),
                  SizedBox(height: 10),
                  Text(
                    "Million of songs,free on spotify",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,wordSpacing: 2),
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
