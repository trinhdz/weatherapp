import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thoitiet/models/weather_model.dart';

class WeatherServices {
  final String apikey = 'e8e200c87dee2c9f19cab82740c3e91e';

  Future<Weather> fetchWeather(String cityName) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Tải dữ liệu thời tiết thất bại: ${response.body}');
    }
  }
}
