import 'package:flutter/cupertino.dart';
import 'package:section9/models/weatherModel.dart';

class weatherProviders extends ChangeNotifier
{
  weatherModel? _weatherData;
  String? cityName;
  set weatherData(weatherModel? weather)
  {
    _weatherData=weather;
    notifyListeners();
  }
  weatherModel? get weatherData => _weatherData;

}
