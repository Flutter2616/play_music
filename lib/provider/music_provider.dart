import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:play_music/model/music_model.dart';
import 'package:play_music/utils/share_preference_class.dart';

class Musicprovider extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool playmusic = false;
  int musicindex = 0;
  Duration musicDuration = Duration(seconds: 0);

  List<MusicModel> likelist = [];
  List<MusicModel> songlist = [
    MusicModel(
        img:
            "https://c.saavncdn.com/815/Bhediya-Hindi-2022-20221206124543-500x500.jpg",
        name: "Apna Bana le",
        like: false,
        singer: "arjitsing"),
    MusicModel(
        img:
            "https://upload.wikimedia.org/wikipedia/en/3/3a/Still-phir-hera-phir.jpg",
        name: "Dhotar chor",
        like: false,
        singer: "arjitsing"),
    MusicModel(
        img: "https://i.ytimg.com/vi/H8EePU-NNX0/mqdefault.jpg",
        name: "Domino cita",
        like: false,
        singer: "Album"),
    MusicModel(
        img: "https://i.ytimg.com/vi/uSSFACVucbs/maxresdefault.jpg",
        name: "Jume jo pathan",
        like: false,
        singer: "Arjit singh,Sukriti"),
    MusicModel(
        img:
            "https://a10.gaanacdn.com/images/albums/58/6922458/crop_480x480_6922458.jpg",
        name: "Abr-e-Karam",
        like: false,
        singer: "Sidharat kasyap"),
    MusicModel(
        img: "https://i.ytimg.com/vi/bqK2uLv_6I8/maxresdefault.jpg",
        name: "Ik mulakat",
        like: false,
        singer: "Palak m,Altamash f"),
    MusicModel(
        img:
            "https://c.saavncdn.com/191/Kesariya-From-Brahmastra-Hindi-2022-20220717092820-500x500.jpg",
        name: "kesariya",
        like: false,
        singer: "arjit singh"),
    MusicModel(
        img:
            "https://c.saavncdn.com/blob/056/Pushpa-The-Rise-Telugu-2021-20211216115409-500x500.jpg",
        name: "Pushpa raj",
        like: false,
        singer: "Nakash A"),
    MusicModel(
        img:
            "https://i.pinimg.com/736x/d6/4a/78/d64a789de4f576240cbea353dfcfd9be.jpg",
        name: "Hanuman Chalisa",
        like: false,
        singer: " Gulshan Kumar"),
  ];

  List<Audio> musiclist = [
    Audio('assets/audio/song3.mp3'),
    Audio('assets/audio/song2.mp3'),
    Audio('assets/audio/song1.mp3'),
    Audio('assets/audio/pathan.mp3'),
    Audio('assets/audio/song4.mp3'),
    Audio('assets/audio/ik_mulakat.mp3'),
    Audio('assets/audio/kesriya.mp3'),
    Audio('assets/audio/pushpa.mp3'),
    Audio('assets/audio/hanuman_chalisa.mp3'),
  ];

  // int index=0;
  void intimusic() {
    assetsAudioPlayer.open(
      Playlist(audios: musiclist, startIndex: musicindex),
      // Audio.network("https://www.youtube.com/watch?v=NqolrXstoA8"),
      autoStart: false,
      showNotification: true,
    );
    musiclenth();
  }

  void playsong() {
    playmusic = true;
    assetsAudioPlayer.play();
    notifyListeners();
  }

  void stopsong() {
    playmusic = false;
    assetsAudioPlayer.pause();
    notifyListeners();
  }

  nextsong() {
    assetsAudioPlayer.next();
    playmusic = true;
    if (musicindex < songlist.length - 1) {
      musicindex++;
    }
    notifyListeners();
  }

  presong() {
    assetsAudioPlayer.previous(keepLoopMode: false);
    playmusic = true;
    if (musicindex > 0) {
      musicindex--;
    }
    notifyListeners();
  }

  void musiclenth() {
    assetsAudioPlayer.current.listen((event) {
      musicDuration = event!.audio.duration;
    });
  }

  int pageindex = 0;

  void bottomnavigation(int value) {
    pageindex = value;
    notifyListeners();
  }

  void songlike(int index) {
    if (songlist[index].like == true) {
      MusicModel s = songlist[index];
      MusicModel update = MusicModel(
          singer: s.singer,
          name: s.name,
          img: s.img,
          like: songlist[index].like = false);
      songlist[index] = update;
      // songlist[index].like=false;
      likelist.removeAt(index);
    } else {
      MusicModel s = songlist[index];
      MusicModel update = MusicModel(
          singer: s.singer,
          name: s.name,
          img: s.img,
          like: songlist[index].like = true);
      songlist[index] = update;
      // songlist[index].like=true;
      likelist.add(songlist[index]);
    }
    notifyListeners();
  }

  //sign up logic

  bool account_option = true;

  void signup_option() {
    if (account_option == false) {
      account_option = true;
    } else {
      account_option = false;
    }
    notifyListeners();
  }

  Future<void> signup_logic(
      TextEditingController txtemail,
      TextEditingController txtusername,
      TextEditingController txtpassword,
      BuildContext context) async {
    if (account_option == false) {
      Sharepre share = Sharepre();
      share.new_account(
          email: txtemail.text,
          username: txtusername.text,
          password: txtpassword.text,
          usersign: true);
      account_option = true;
    } else {
      Sharepre share = Sharepre();
      Map m1 = await share.login_account();
      if (txtemail.text == m1['email']&& txtpassword.text == m1['password']) {
        Navigator.pushReplacementNamed(context, 'dash');
        final snackBar = SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,showCloseIcon: false,
          content: AwesomeSnackbarContent(
            title: 'Login successfully!',
            message:
            'Enjoy with spotify',color: Colors.green,
            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
      else
        {
          final snackBar = SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,showCloseIcon: false,
            content: AwesomeSnackbarContent(
              title: 'Wrong',
              message:
              'Invalid email id & password',
              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
    }
    notifyListeners();
  }
}
