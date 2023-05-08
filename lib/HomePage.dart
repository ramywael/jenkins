

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section9/weatherProviders/weatherProviders.dart';

import 'SearchPage.dart';
import 'models/weatherModel.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateui()
  {
    setState(() {
    });
  }
  weatherModel? weatherData;


  @override
  Widget build(BuildContext context) {
    weatherData=Provider.of<weatherProviders>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "WeatherApp",
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return SearchPage(
                UpdateUI:updateui,
              );
            }));

          }, icon: Icon(
            Icons.search,
          ))
        ],
      ),
      body: Provider.of<weatherProviders>(context).weatherData==null ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "there is no weather 😔 Start",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              "Searching Now 🔍",
              style:TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ): Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                 weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,
              ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3,),
            Text(
              Provider.of<weatherProviders>(context).cityName!,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Updated at ${weatherData!.date.year.toString()}-${weatherData!.date.day.toString()}-${weatherData!.date.month.toString()}" " " " ${weatherData!.date.hour}:${weatherData!.date.minute}",
              style: TextStyle(
                fontSize: 20,
           //     fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 3,),
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
            Spacer(flex: 3,),
            Text(
              weatherData!.weatherStateName,
              style: TextStyle(
                fontSize: 30,
                   fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 5,)



          ],
        ),
      ),
    );
  }
}
