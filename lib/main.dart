import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:module_11_live_test/weather.dart';

void main() {
  runApp(const WeatherApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Module 11 Live Test',
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<WeatherApp> {
  List<Weather> weatherData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('YOUR_JSON_URL_HERE'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<Weather> data = jsonData.map((item) => Weather.fromJson(item)).toList();

      setState(() {
        weatherData = data;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Information'),
        ),
        body: ListView.builder(
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(weatherData[index].city),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Temperature: ${weatherData[index].temperature}°C'),
                  Text('Condition: ${weatherData[index].condition}'),
                  Text('Humidity: ${weatherData[index].humidity}%'),
                  Text('Wind Speed: ${weatherData[index].windSpeed} m/s'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
