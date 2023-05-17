import 'package:shared_preferences/shared_preferences.dart';

class Sharepre
{
  Future<void> for_introscreen()
  async {
    SharedPreferences share=await SharedPreferences.getInstance();
    share.setBool('intro', true);
  }

  Future<bool?> for_introscreen_status()
  async {
    SharedPreferences share=await SharedPreferences.getInstance();
    bool? introstatus= share.getBool('intro');
    return introstatus;
  }
}