import 'package:flutter/cupertino.dart';
import 'package:section9/models/weatherModel.dart';

// class weatherProviders extends ChangeNotifier {
//   weatherModel? _weatherData;
//   String? cityName;
//   set weatherData(weatherModel? weather)
//   {
//     _weatherData=weather;
//     notifyListeners();
//   }
//   weatherModel? get weatherData => _weatherData;
//
// }






///Provider part



// class WeatherProviders extends ChangeNotifier{
//   String? cityName;
//   WeatherModel? _model;
//    void set WeatherData(WeatherModel? weatherMmodel)
//    {
//      _model=weatherMmodel;
//      notifyListeners();
//
//      ///to notify that object has been changed
//    }
//    WeatherModel? get WeatherData
//    {
//      return _model;
//    }
// }



class WeatherProviders extends ChangeNotifier{
  String? cityName;
  WeatherModel? _model;
  void set WeatherData(WeatherModel? weatherMmodel)
  {
    _model=weatherMmodel;
    notifyListeners();

    ///to notify that object has been changed
  }
  WeatherModel? get WeatherData
  {
    return _model;
  }
}