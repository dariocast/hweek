import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:settimana_santa/asset_audio_player_icons.dart';

class MiserereRoute extends StatefulWidget {
  static var routeName = 'miserere';

  @override
  State<StatefulWidget> createState() {
    return _MiserereRouteState();
  }
}

class _MiserereRouteState extends State<MiserereRoute> {
  final audio = "assets/audios/song1.mp3";

  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Il Miserere'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 48.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _assetsAudioPlayer.open(audio);
              },
              child: Text("Playlist test"),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: _assetsAudioPlayer.current,
                  builder: (BuildContext context, AsyncSnapshot<PlayingAudio> snapshot) {
                    final PlayingAudio playing = snapshot.data;

                    return ListTile(
                        title: Text(playing.assetAudioPath.split("/").last,
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                StreamBuilder(
                  stream: _assetsAudioPlayer.isLooping,
                  initialData: false,
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return RaisedButton(
                      child: Text(snapshot.data ? "Looping" : "Not looping"),
                      onPressed: () {
                        _assetsAudioPlayer.toggleLoop();
                      },
                    );
                  },
                ),
                SizedBox(width: 20),
                RaisedButton(
                  child: Text("Seek to 2:00"),
                  onPressed: () {
                    _assetsAudioPlayer.seek(Duration(minutes: 2));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder(
                    stream: _assetsAudioPlayer.currentPosition,
                    builder: (context, asyncSnapshot) {
                      final Duration duration = asyncSnapshot.data;
                      return Text(duration.toString());
                    }),
                Text(" - "),
                StreamBuilder(
                  stream: _assetsAudioPlayer.current,
                  builder: (BuildContext context, AsyncSnapshot<PlayingAudio> snapshot) {
                    Duration duration = Duration();
                    if (snapshot.hasData) {
                      duration = snapshot.data.duration;
                    }
                    return Text(durationToString(duration));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder(
                  stream: _assetsAudioPlayer.isPlaying,
                  initialData: false,
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return IconButton(
                      onPressed: () {
                        _assetsAudioPlayer.playOrPause();
                      },
                      icon: Icon(snapshot.data ? AssetAudioPlayerIcons.pause : AssetAudioPlayerIcons.play),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String durationToString(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
