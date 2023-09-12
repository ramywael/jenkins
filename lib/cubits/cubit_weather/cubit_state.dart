import 'package:section9/models/weatherModel.dart';

///Now we will add the states that our app will work on it and they are 4 states

abstract class WeatherState {}

class InitailState extends WeatherState {}

class LoadingState extends WeatherState {}

class SuccessedState extends WeatherState {
  WeatherModel? model;
  SuccessedState({this.model});
}

class FailureState extends WeatherState {}
