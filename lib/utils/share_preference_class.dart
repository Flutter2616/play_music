import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharepre
{
  Future<void> for_introscreen() async {
    SharedPreferences share=await SharedPreferences.getInstance();
    share.setBool('intro', true);
  }

  Future<bool?> for_introscreen_status() async {
    SharedPreferences share=await SharedPreferences.getInstance();
    bool? introstatus= share.getBool('intro');
    return introstatus;
  }

  Future<void> new_account(
      {required String? email,
      required String? username,
      required String? password,
      required bool? usersign}) async {
    SharedPreferences share=await SharedPreferences.getInstance();
    share.setString('user', username!);
    share.setString('email', email!);
    share.setString('password', password!);
    share.setBool('usersign', usersign!);
  }

  Future<Map<String, dynamic>> login_account()
  async {
    SharedPreferences share=await SharedPreferences.getInstance();
    String? name=share.getString('user');
    String? email=share.getString('email');
    String? password=share.getString('password');
    bool? usersign=share.getBool('usersign');
    return {'name':name,'email':email,'password':password,'usersign':usersign};
  }

  Future<void> logout(BuildContext context)
  async {
    SharedPreferences share=await SharedPreferences.getInstance();
    share.clear();
    Navigator.pushReplacementNamed(context, 'login');
  }
}