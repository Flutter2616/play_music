import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:play_music/model/music_model.dart';

class Musicprovider extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool playmusic = false;
  int? musicindex;
  Duration musicDuration = Duration(seconds: 0);

  List songlist = [
    MusicModel(
        img:
            "https://c.saavncdn.com/815/Bhediya-Hindi-2022-20221206124543-500x500.jpg",
        name: "Apna Bana le",
        music: "assets/audio/song3.mp3",
        singer: "arjitsing"),
    MusicModel(
        img:
            "https://wallpapercave.com/wp/wp5510430.jpg",
        name: "Dhotar chor",
        music: "assets/audio/song2.mp3",
        singer: "arjitsing"),
    MusicModel(
        img:
            "https://c.saavncdn.com/815/Bhediya-Hindi-2022-20221206124543-500x500.jpg",
        name: "Domino cita",
        music: "assets/audio/song1.mp3",
        singer: "Album"),
  ];

  List<Audio> musiclist=[
    Audio('assets/audio/song1.mp3'),
    Audio('assets/audio/song2.mp3'),
    Audio('assets/audio/song3.mp3'),
  ];

  // int index=0;
  void intimusic() {
    assetsAudioPlayer.open(
      Playlist(audios: musiclist,startIndex: 0),
      // Audio("${songlist[1].music}"),
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
    notifyListeners();
  }

  presong() {
    assetsAudioPlayer.previous();
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

  void musicindexpass(int index)
  {
    musicindex=index;
    notifyListeners();
  }
}
