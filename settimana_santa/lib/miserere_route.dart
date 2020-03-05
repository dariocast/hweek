import 'dart:convert';

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
  final audio = "assets/audios/miserere.mp3";

  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    TestoMiserere testo = TestoMiserere.getTesto();
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
            Expanded(
                child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: testo.strofe.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(5.0),
                  title: Text(testo.strofe[index].cantato),
                  subtitle: Text(testo.strofe[index].letto),
                );
              },
            )),
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
                  builder: (BuildContext context,
                      AsyncSnapshot<PlayingAudio> snapshot) {
                    Duration duration = Duration();
                    if (snapshot.hasData) {
                      duration = snapshot.data.duration;
                    }
                    return Text(durationToString(duration));
                  },
                ),
              ],
            ),
            StreamBuilder(
              stream: _assetsAudioPlayer.isPlaying,
              initialData: false,
              builder:
                  (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        _assetsAudioPlayer.pause();
                        _assetsAudioPlayer.seek(Duration());
                      },
                      icon: Icon(AssetAudioPlayerIcons.stop),
                    ),
                    IconButton(
                      onPressed: () {
                        _assetsAudioPlayer.playOrPause();
                      },
                      icon: Icon(snapshot.data
                          ? AssetAudioPlayerIcons.pause
                          : AssetAudioPlayerIcons.play),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer.open(audio);
    _assetsAudioPlayer.pause();
  }
}

String durationToString(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
  String twoDigitSeconds =
      twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
  return "$twoDigitMinutes:$twoDigitSeconds";
}

class TestoMiserere {
  final String titolo;
  final List<StrofaTestoMiserere> strofe;

  TestoMiserere({this.titolo, this.strofe});

  factory TestoMiserere.fromJson(Map<String, dynamic> json) {
    return TestoMiserere(titolo: json['titolo'], strofe: json['strofe']);
  }

  static getTesto() {
    List<StrofaTestoMiserere> listaStrofe = new List();
    Map<String, dynamic> testoJson = jsonDecode(
        "{ \"titolo\": \"MISERERE (Salmo 50)\",\"strofe\": [{ \"cantato\": \"Miserere mei, Deus, secundum magnam misericordiam tuam.\", \"letto\": \"Et secundum multitudinem miserationum tuarum, dele iniquitatem meam.\"},{ \"cantato\": \"Amplius lava me ab iniquitate mea: et a peccato meo munda me.\", \"letto\": \"Quoniam iniquitatem meam ego cognosco: et peccatum meum contra me est semper.\"},{ \"cantato\": \"Tibi soli peccavi et malum coram te feci: ut justificeris in sermonibus tuis, et vincas cum judicaris.\", \"letto\": \"Ecce enim in iniquitatibus conceptus sum: et in peccatis concepit me mater mea.\"},{ \"cantato\": \"Ecce enim veritatem dilexisti: incerta et occulta sapientiae tuae manifestasti mihi.\", \"letto\": \"Asperges me hyssopo, et mundabor: lavabis me, et super nivem dealbabor.\"},{ \"cantato\": \"Auditui meo dabis gaudium et laetitiam: et exultabunt ossa humiliata.\", \"letto\": \"Averte faciem tuam a peccatis meis: et omnes iniquitates meas dele.\"},{ \"cantato\": \"Cor mundum crea in me, Deus: et spiritum rectum innova in visceribus meis.\", \"letto\": \"Ne projicias me a facie tua: et Spiritum sanctum tuum ne auferas a me.\"},{ \"cantato\": \"Redde mihi laetitiam salutaris tui: et spiritu principali confirma me.\", \"letto\": \"Docebo iniquos vias tuas: et impii ad te convertentur.\"},{ \"cantato\": \"Libera me de sanguinibus, Deus, Deus salutis meae: et exultabit lingua mea justitiam tuam.\", \"letto\": \"Domine, labia mea aperies: et os meum annuntiabit laudem tuam.\"},{ \"cantato\": \"Quoniam si voluisses sacrificium, dedissem utique: holocaustis non delectaberis.\", \"letto\": \"Sacraficium Deo spiritus contribulatus: cor contritum et humiliatum Deus non despicies.\"},{ \"cantato\": \"Benigne fac, Domine, in bona voluntate tua Sion: ut aedificentur muri Jerusalem.\", \"letto\": \"Tunc acceptabis sacrificium justitiae, oblationes, et holocausta: tunc imponent super altare tuum vitulos.\"}]}");
    for (int i = 0; i < testoJson['strofe'].length; i++) {
      StrofaTestoMiserere strofa = StrofaTestoMiserere(
          cantato: testoJson['strofe'][i]['cantato'],
          letto: testoJson['strofe'][i]['letto']);
      listaStrofe.add(strofa);
    }
    TestoMiserere testo =
        TestoMiserere(titolo: testoJson['titolo'], strofe: listaStrofe);
    return testo;
  }
}

class StrofaTestoMiserere {
  final String cantato;
  final String letto;

  StrofaTestoMiserere({this.cantato, this.letto});

  factory StrofaTestoMiserere.fromJson(Map<String, dynamic> json) {
    return StrofaTestoMiserere(cantato: json['cantato'], letto: json['letto']);
  }
}
