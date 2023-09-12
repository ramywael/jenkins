import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:section9/services/weatherServices.dart';
import 'package:section9/weatherProviders/weatherProviders.dart';

import 'HomePage.dart';
import 'cubits/cubit_weather/cubit_weather.dart';

// void main() {
//   runApp( ChangeNotifierProvider(
//       create: (BuildContext context) {
//         return weatherProviders();
//       },
//  child: WeatherApp(),
//   )
//   );
// }
//
// class WeatherApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//     theme: ThemeData(
//       primarySwatch: Provider.of<weatherProviders>(context).weatherData==null ? Colors.blue : Provider.of<weatherProviders>(context).weatherData!.getThemeColor()
//     ),
//       home: HomePage(),
//     );
//
//   }
//
//
// }

///ProviderPart
// void main() {
//   runApp(ChangeNotifierProvider(
//       create: (BuildContext context) {
//         return WeatherProviders();
//       },
//       child: WeatherApp()));
// }
//
// class WeatherApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Provider.of<WeatherProviders>(context).WeatherData ==
//                 null
//             ? Colors.blue
//             : Provider.of<WeatherProviders>(context).WeatherData!.getColor(),
//       ),
//       home: HomePage(),
//     );
//   }
// }

void main() {
  runApp(BlocProvider<CubitWeather>(
      create: (BuildContext context) {
        return CubitWeather(WeatherServices());
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: BlocProvider.of<CubitWeather>(context).model == null ? Colors.blue : BlocProvider.of<CubitWeather>(context).model!.getColor()
          ),
      home: HomePage(),
    );
  }
}
