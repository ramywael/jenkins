import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:section9/cubits/cubit_weather/cubit_state.dart';
import 'package:section9/services/weatherServices.dart';

import '../../models/weatherModel.dart';

///Here we will type the logic here to implement the app

class CubitWeather extends Cubit<WeatherState> {
  CubitWeather(this.service) : super(InitailState());
  WeatherModel? model;
  String? cityName;
  WeatherServices service;
  /// in this constructor here he needs to take an initial state to  respon to it
  /// So what is the logic?
  /// The logic is fetching the data from api to display it
  /// So the logic is in WeatherServices
  ///We need to set the trigger (Function)
  ///Trigger
  void getWeather({required String cityName}) async {
    emit(LoadingState());
   try{
     model = await service.getWeather(cityName: cityName);
     emit(SuccessedState());
   } on Exception catch(e)
    {
      emit(FailureState());
    }
  }
}
