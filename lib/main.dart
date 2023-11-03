import 'package:flutter/material.dart';
import 'package:module_11_live_test/weather_json.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Information'),
        ),
        body: ListView.builder(
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            final weather = weatherData[index];
            return ListTile(
              title: Text(weather.city),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Temperature: ${weather.temperature}°C'),
                  Text('Condition: ${weather.condition}'),
                  Text('Humidity: ${weather.humidity}%'),
                  Text('Wind Speed: ${weather.windSpeed} m/s'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
