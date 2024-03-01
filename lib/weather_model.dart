class Coord {
  final double lon;
  final double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
        lon: double.parse(json['lon'].toString()),
        lat: double.parse(json['lat'].toString()));
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }
}

class Main {
  final double temp;
  final double pressure;
  final int humidity;
  final double temp_min;
  final double temp_max;
  final double sea_level;
  final double grnd_level;

  Main(
      {required this.temp,
      required this.pressure,
      required this.humidity,
      required this.temp_min,
      required this.temp_max,
      required this.sea_level,
      required this.grnd_level});

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
        temp: double.parse(json['temp'].toString()),
        temp_min: double.parse(json['temp_min'].toString()),
        temp_max: double.parse(json['temp_max'].toString()),
        sea_level: json['sea_level'] == null
            ? 0.0
            : double.parse(json['sea_level'].toString()),
        grnd_level: json['grnd_level'] == null
            ? 0.0
            : double.parse(json['grnd_level'].toString()),
        pressure: double.parse(json['pressure'].toString()),
        humidity: json['humidity']);
  }
}

class Wind {
  final double speed;
  final double deg;

  Wind({required this.speed, required this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
        speed: double.parse(json['speed'].toString()),
        deg: double.parse(json['deg'].toString()));
  }
}

class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all']);
  }
}

class Sys {
  final double message;
  final String country;
  final int sunrise;
  final int sunset;

  Sys(
      {required this.message,
      required this.country,
      required this.sunrise,
      required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
        message: json['message'],
        country: json['country'],
        sunset: json['sunset'],
        sunrise: json['sunrise']);
  }
}

class WeatherModel {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int id;
  final String name;
  final int cod;

  WeatherModel(
      {required this.coord,
      required this.weather,
      required this.base,
      required this.main,
      required this.visibility,
      required this.wind,
      required this.clouds,
      required this.dt,
      required this.sys,
      required this.id,
      required this.name,
      required this.cod});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        coord: Coord.fromJson(json['coord']),
        weather: (json['weather'] as List)
            .map((item) => Weather.fromJson(item))
            .toList(),
        base: json['base'],
        main: Main.fromJson(json['main']),
        visibility: json['visibility'],
        wind: Wind.fromJson(json['wind']),
        clouds: Clouds.fromJson(json['clouds']),
        dt: json['dt'],
        sys: Sys.fromJson(json['sys']),
        id: json['id'],
        name: json['name'],
        cod: json['cod']);
  }
}
