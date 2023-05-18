import 'package:flutter/material.dart';
import 'package:play_music/provider/music_provider.dart';
import 'package:play_music/utils/share_preference_class.dart';
import 'package:play_music/view/music_play_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController txtusername = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mt = Provider.of<Musicprovider>(context, listen: true);
    mf = Provider.of<Musicprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SizedBox(
            height: 95.h,
            width: 100.w,
            child: Stack(
              children: [
                Container(
                  height: 50.h,
                  width: 100.w,
                  padding: EdgeInsets.symmetric(vertical: 80.sp),
                  decoration: BoxDecoration(
                      color: Colors.green.shade400,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(60.sp),
                          bottomLeft: Radius.circular(60.sp))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/image/logo1.png",
                          width: 80.w, height: 10.h, fit: BoxFit.cover),
                      SizedBox(height: 10),
                      Text(
                        "Million of songs, free on spotify",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            wordSpacing: 2),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(
                          top: 10.sp, left: 15.sp, right: 15.sp, bottom: 10.sp),
                      margin: EdgeInsets.all(20),
                      height: 55.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.sp))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              mt!.account_option
                                  ? "Login Account"
                                  : "Create Account",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp)),
                          SizedBox(height: 2.h),
                          Visibility(
                            visible: mt!.account_option ? false : true,
                            child: Container(
                              height: 5.h,
                              width: 100.w,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.sp),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
                                  controller: txtusername,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      suffixIcon: Icon(Icons.email_outlined,
                                          color: Colors.grey),
                                      hintText: 'Username')),
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Container(
                            height: 5.h,
                            width: 100.w,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.sp),
                                border: Border.all(color: Colors.grey)),
                            child: TextFormField(
                                controller: txtemail,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    suffixIcon: Icon(Icons.email_outlined,
                                        color: Colors.grey),
                                    hintText: 'Email')),
                          ),
                          SizedBox(height: 3.h),
                          Container(
                            height: 5.h,
                            width: 100.w,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.sp),
                                border: Border.all(color: Colors.grey)),
                            child: TextFormField(
                                controller: txtpassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    suffixIcon: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.grey),
                                    hintText: 'Password')),
                          ),
                          SizedBox(height: 1.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Remember me",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp)),
                              Spacer(),
                              Switch.adaptive(
                                value: true,
                                onChanged: (value) {},
                                activeColor: Colors.green,
                                activeTrackColor: Colors.green.shade200,
                                inactiveTrackColor: Colors.grey,
                              )
                            ],
                          ),
                          SizedBox(height: 1.h),
                          InkWell(
                            onTap: () {
                             mf!.signup_logic(txtemail,txtusername,txtpassword,context);
                            },
                            child: Container(
                              height: 5.h,
                              width: 100.w,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50.sp),
                              ),
                              child: Text(
                                  mt!.account_option ? "Log in" : "Sign up",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text("or",
                              style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp)),
                          SizedBox(height: 2.h),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 11.w,
                                alignment: Alignment.center,
                                width: 11.w,
                                child: Text("G+",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold)),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red.shade700),
                              ),
                              SizedBox(width: 5.w),
                              Container(
                                height: 11.w,
                                alignment: Alignment.center,
                                width: 11.w,
                                child: Text("f",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold)),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.blue),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Visibility(
                            visible: mt!.account_option ? true : false,
                            child: Text("Forget password?",
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Dont's have an account?",
                            style: TextStyle(
                                letterSpacing: 2,
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500)),
                        TextButton(
                            onPressed: () {
                              mf!.signup_option();
                            },
                            child: Text(
                              mt!.account_option ? "Sign up now" : "Sign in!",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color: Colors.green),
                            ))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
