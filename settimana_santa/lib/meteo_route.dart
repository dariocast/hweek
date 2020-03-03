import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:settimana_santa/weather_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:locales/locales.dart';


const String apiKey = "2725dd88bd39461b360242b070542255";

class MeteoRoute extends StatefulWidget {
  static var routeName = 'meteo';

  @override
  State<StatefulWidget> createState() {
    return _MeteoRouteState();
  }
}

class _MeteoRouteState extends State<MeteoRoute> {
//  WeatherModel nome = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Previsioni Meteo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: FutureBuilder<WeatherModel>(
            future: getWeather(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                WeatherModel model = snapshot.data;
                initializeDateFormatting(Locale.it_IT.toString());
                //Format date
                var fm = new DateFormat('dd MMMM yyyy', Locale.it_IT.toString());
                var fm_hour = new DateFormat.Hm();

                print(model.weather[0].icon);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Image.network(
                            //  'https://openweathermap.org/img/w/${model.weather[0].icon}.png',
                            //  width: 50,
                            //  height: 50,
                            //),
                            Image.asset(
                              'assets/images/weather/${model.weather[0].icon}.png',
                              width: 100,
                              fit: BoxFit.fitWidth,
                            ),
                            Text(
                              '${model.main.temp}°C',
                              style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              '${model.name}',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              '${model.main.temp_max}/${model.main.temp_min}',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Roboto',
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              '${model.weather[0].description}'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Roboto',
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 400,
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(30.0),
                                topRight: const Radius.circular(30.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Text(
                                    'Oggi',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        height: 1,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  new Text(
                                    '${fm.format(new DateTime.fromMillisecondsSinceEpoch((model.dt * 1000), isUtc: true))}',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1,
                                      letterSpacing: 0.25,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Text(
                                    '',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        height: 1.5,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        color:
                                            Color.fromRGBO(31, 42, 255, 1.0)),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: new ListView(
                                        // This next line does the trick.
                                        scrollDirection: Axis.horizontal,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            padding: EdgeInsets.all(20),
                                            width: 160.0,
                                            decoration: new BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Theme.of(context).canvasColor,
                                              boxShadow: [
                                                new BoxShadow(
                                                  color: Theme.of(context).primaryColor,
                                                  blurRadius: 1.0,
                                                )
                                              ],
                                            ),
                                            child: new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.wb_sunny,
                                                  color: Colors.orange,
                                                  size: 40,
                                                ),
                                                Text(
                                                  'Feels like',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    height: 1.5,
                                                    letterSpacing: 0.25,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                                Text(
                                                  '${model.main.temp}°C',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    height: 1.0,
                                                    letterSpacing: 0.25,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            padding: EdgeInsets.all(20),
                                            width: 160.0,
                                            decoration: new BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Theme.of(context).canvasColor,
                                              boxShadow: [
                                                new BoxShadow(
                                                  color: Theme.of(context).primaryColor,
                                                  blurRadius: 1.0,
                                                )
                                              ],
                                            ),
                                            child: new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.toys,
                                                  color: Colors.blueGrey,
                                                  size: 40,
                                                ),
                                                Text(
                                                  'Wind',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    height: 1.5,
                                                    letterSpacing: 0.25,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                                Text(
                                                  '${model.wind.speed} m/s',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    height: 1.0,
                                                    letterSpacing: 0.25,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            padding: EdgeInsets.all(20),
                                            width: 160.0,
                                            decoration: new BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Theme.of(context).canvasColor,
                                              boxShadow: [
                                                new BoxShadow(
                                                  color: Theme.of(context).primaryColor,
                                                  blurRadius: 1.0,
                                                )
                                              ],
                                            ),
                                            child: new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.opacity,
                                                  color: Colors.blueAccent,
                                                  size: 40,
                                                ),
                                                Text(
                                                  'Humidity',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    height: 1.5,
                                                    letterSpacing: 0.25,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                                Text(
                                                  '${model.main.humidity} %',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    height: 1.0,
                                                    letterSpacing: 0.25,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(20),
                                            margin: EdgeInsets.all(5),
                                            width: 160.0,
                                            decoration: new BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Theme.of(context).canvasColor,
                                              boxShadow: [
                                                new BoxShadow(
                                                  color: Theme.of(context).primaryColor,
                                                  blurRadius: 1.0,
                                                )
                                              ],
                                            ),
                                            child: new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.arrow_downward,
                                                  color: Colors.redAccent,
                                                  size: 40,
                                                ),
                                                Text(
                                                  'Pressure',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    height: 1.5,
                                                    letterSpacing: 0.25,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                                Text(
                                                  '${model.main.pressure} hPa',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    height: 1.0,
                                                    letterSpacing: 0.25,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(20),
                                            margin: EdgeInsets.all(5),
                                            width: 160.0,
                                            decoration: new BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Theme.of(context).canvasColor,
                                              boxShadow: [
                                                new BoxShadow(
                                                  color: Theme.of(context).primaryColor,
                                                  blurRadius: 1.0,
                                                )
                                              ],
                                            ),
                                            child: new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                new Icon(
                                                  Icons.visibility,
                                                  color: Colors.black54,
                                                  size: 40,
                                                ),
                                                Text(
                                                  'Visibility',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    height: 1.5,
                                                    letterSpacing: 0.25,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                                Text(
                                                  '${model.visibility / 1000} km',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    height: 1.0,
                                                    letterSpacing: 0.25,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    margin: EdgeInsets.all(5),
                                    width: double.infinity,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      boxShadow: [
                                        new BoxShadow(
                                          color: Theme.of(context).primaryColor,
                                          blurRadius: 1.0,
                                        )
                                      ],
                                    ),
                                    child: new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        new Icon(
                                          Icons.cloud,
                                          color: Colors.black54,
                                          size: 40,
                                        ),
                                        Text(
                                          'Clouds',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            height: 1.5,
                                            letterSpacing: 0.25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                        Text(
                                          '${model.clouds.all} %',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            height: 1.0,
                                            letterSpacing: 0.25,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError)
                return Container(
                  height: 500,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/bug_fixed.png',
                        width: 250,
                        fit: BoxFit.fitWidth,
                      ),
                      Text(
                        ' ',
                        style: TextStyle(
                          height: 1.5,
                        ),
                      ),
                      Text(
                        'Oh Oh, Houston we have a problem!',
                        style: TextStyle(
                            fontSize: 20.0,
                            height: 1.0,
                            letterSpacing: 0.25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        ' ',
                        style: TextStyle(
                          height: 1.0,
                        ),
                      ),
                      Text(
                        'Check your network or give the location permission to the app.',
                        style: TextStyle(
                            fontSize: 15.0,
                            height: 1.0,
                            letterSpacing: 0.25,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      //Text(
                      //  '${snapshot.error}',
                      //  style: TextStyle(
                      //      fontSize: 20.0,
                      //      height: 1.5,
                      //      letterSpacing: 0.25,
                      //      color: Colors.red),
                      //),
                    ],
                  ),
                );
              return CircularProgressIndicator(); //Default show loading
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  Future<WeatherModel> getWeather() async {
    final response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?zip=80063,it&appid=' +
            apiKey);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      var model = WeatherModel.fromJson(result);
      return model;
    } else
      throw Exception('Failed to load Weather Information');
  }
}
