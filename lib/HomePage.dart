import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:section9/cubits/cubit_weather/cubit_state.dart';
import 'package:section9/cubits/cubit_weather/cubit_weather.dart';
import 'package:section9/services/weatherServices.dart';
import 'package:section9/weatherProviders/weatherProviders.dart';

import 'SearchPage.dart';
import 'models/weatherModel.dart';

// class HomePage extends StatefulWidget {
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   void updateui()
//   {
//     setState(() {
//     });
//   }
//   weatherModel? weatherData;
//
//
//   @override
//   Widget build(BuildContext context) {
//     weatherData=Provider.of<weatherProviders>(context).weatherData;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//             "WeatherApp",
//         ),
//         actions: [
//           IconButton(onPressed: (){
//             // عبارة عن statement بنفذها عشان كدا فى الاخر  بحط ;
//             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
//               return SearchPage(
//                 UpdateUI:updateui,
//               );
//             }));
//
//           }, icon: Icon(
//             Icons.search,
//           ))
//         ],
//       ),
//       body: Provider.of<weatherProviders>(context).weatherData==null ? Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "there is no weather 😔 Start",
//               style: TextStyle(
//                 fontSize: 30,
//               ),
//             ),
//             Text(
//               "Searching Now 🔍",
//               style:TextStyle(
//                 fontSize: 30,
//               ),
//             )
//           ],
//         ),
//       ): Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: [
//                  weatherData!.getThemeColor(),
//                 weatherData!.getThemeColor()[300]!,
//                 weatherData!.getThemeColor()[100]!,
//               ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           )
//
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Spacer(flex: 3,),
//             Text(
//               Provider.of<weatherProviders>(context).cityName!,
//               style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "Updated at ${weatherData!.date.year.toString()}-${weatherData!.date.day.toString()}-${weatherData!.date.month.toString()}" " " " ${weatherData!.date.hour}:${weatherData!.date.minute}",
//               style: TextStyle(
//                 fontSize: 20,
//            //     fontWeight: FontWeight.bold,
//               ),
//             ),
//             Spacer(flex: 3,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Image.asset(weatherData!.getImage()),
//               Text(
//                 weatherData!.temp.toInt().toString(),
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Column(
//                 children: [
//                   Text(
//                     "MaxTemp:${weatherData!.maxTemp.toInt()}",
//                     style: TextStyle(
//                       fontSize: 15,
//                      fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                      "MinTemp:${weatherData!.minTemp.toInt()}",
//                 //    "MinTemp:30",
//                     style: TextStyle(
//                       fontSize: 15,
//                          fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//             ),
//             Spacer(flex: 3,),
//             Text(
//               weatherData!.weatherStateName,
//               style: TextStyle(
//                 fontSize: 30,
//                    fontWeight: FontWeight.bold,
//               ),
//             ),
//             Spacer(flex: 5,)
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//

class HomePage extends StatelessWidget {
   WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    // weatherData=BlocProvider.of<CubitWeather>(context).model;
    //get
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ));
              },
              icon: Icon(
                Icons.search,
              ))
        ],
      ),
      body: BlocBuilder<CubitWeather, WeatherState>(
        builder: (context, state) {
          ///Based on blocState
          if (state is FailureState) {
            return  Center(
              child: Text("Sorry Something Wrong",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            );
          } else if (state is LoadingState) {
            return LoadingWidgetState();
          } else if (state is SuccessedState) {
          weatherData = BlocProvider.of<CubitWeather>(context).model;
            return SucceedWidgetState(weatherData: weatherData);
          } else  {
            return InitialWidgetState();
          }
        },
      ),
    );
  }
}

class SucceedWidgetState extends StatelessWidget {
  const SucceedWidgetState({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          weatherData!.getColor(),
          weatherData!.getColor()[300]!,
          weatherData!.getColor()[100]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 3,
          ),
          Text(
            Provider.of<CubitWeather>(context).cityName!,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Updated at ${weatherData!.date.year.toString()}-${weatherData!.date.day.toString()}-${weatherData!.date.month.toString()}"
            " "
            " ${weatherData!.date.hour}:${weatherData!.date.minute}",
            style: TextStyle(
              fontSize: 20,
              //     fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(
            flex: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                weatherData!.temp.toInt().toString(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    "MaxTemp:${weatherData!.maxTemp.toInt()}",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "MinTemp:${weatherData!.minTemp.toInt()}",
                    //    "MinTemp:30",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(
            flex: 3,
          ),
          Text(
            weatherData!.weatherStateName,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}

class LoadingWidgetState extends StatelessWidget {
  const LoadingWidgetState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class InitialWidgetState extends StatelessWidget {
  const InitialWidgetState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "There is no Weather to found",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Search now",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
