import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'weather_api.dart';

class WeatherForecastPage extends StatefulWidget {
  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  late Future<Map<String, dynamic>?> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = fetchWeatherData('Australia');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final weatherInfo = snapshot.data;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: weatherInfo?.length ?? 0,
                    itemBuilder: (context, index) {
                      final key = weatherInfo!.keys.elementAt(index);
                      final value = weatherInfo[key];

                      return ListTile(
                        title: Text('$key: $value'),
                      );
                    },
                  ),
                ),
                // WebView(
                //   initialUrl: 'https://openweathermap.org/',
                //   javascriptMode: JavascriptMode.unrestricted,
                // ),
              ],
            );
          }
        },
      ),
    );
  }
}
