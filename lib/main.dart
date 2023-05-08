import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section9/weatherProviders/weatherProviders.dart';

import 'HomePage.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (BuildContext context) {
        return weatherProviders();
      },
 child: WeatherApp(),
  )
  );
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Provider.of<weatherProviders>(context).weatherData==null ? Colors.blue : Provider.of<weatherProviders>(context).weatherData!.getThemeColor()
    ),
      home: HomePage(),
    );

  }


}