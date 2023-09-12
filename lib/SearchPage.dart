import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:section9/HomePage.dart';
import 'package:section9/cubits/cubit_weather/cubit_weather.dart';
import 'package:section9/models/weatherModel.dart';
import 'package:section9/services/weatherServices.dart';
import 'package:section9/weatherProviders/weatherProviders.dart';

// class SearchPage extends StatelessWidget {
//  String? cityName;
//  VoidCallback? UpdateUI;
//  SearchPage({this.UpdateUI});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Search a city Now",
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 17),
//           child: TextField(
//             onChanged: (data){
//               cityName=data;
//             },
//
//             onSubmitted: (data) async {
//               cityName=data;
//               weatherServices weatherService=new weatherServices();
//               weatherModel? model=  await weatherService.getWeather(cityName: cityName!);
//               Provider.of<weatherProviders>(context,listen: false).weatherData=model;
//               Provider.of<weatherProviders>(context,listen: false).cityName=cityName;
//
//               //   UpdateUI!();
//               Navigator.pop(context);
//             },
//              decoration: InputDecoration(
//                contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 24),
//                border: OutlineInputBorder(
//                  borderRadius: BorderRadius.circular(15),
//                ),
//                labelText: "Enter a city",
//                suffixIcon: GestureDetector(
//                  onTap: () async {
//                   // cityName=data;
//                    weatherServices weatherService=new weatherServices();
//                    weatherModel? model=  await weatherService.getWeather(cityName: cityName!);
//                    Provider.of<weatherProviders>(context,listen: false).weatherData=model;
//                    Provider.of<weatherProviders>(context,listen: false).cityName=cityName;
//
//                    //   UpdateUI!();
//                    Navigator.pop(context);
//                  },
//                  child: Icon(
//                    Icons.search,
//                  ),
//                )
//
//              ),
//
//           ),
//         ),
//       ),
//
//     );
//   }
// }



class SearchPage extends StatelessWidget {
String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SearhcPage",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (String data) async
              {
                // cityName=data;
                // WeatherServices service=WeatherServices();
                // WeatherModel? model= await  service.getWeather(cityName: cityName!);
                // Provider.of<WeatherProviders>(context,listen: false).WeatherData=model;
                // Provider.of<WeatherProviders>(context,listen: false).cityName=cityName;
                // Navigator.pop(context);
                cityName=data;
                ///we activate the trigger
                BlocProvider.of<CubitWeather>(context).getWeather(cityName: cityName!);
                  BlocProvider.of<CubitWeather>(context).cityName=cityName;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.search_rounded,
                  ),
                ),
                hintText: "Search a city",
                contentPadding: EdgeInsets.all(30),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
