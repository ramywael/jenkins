
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section9/HomePage.dart';
import 'package:section9/models/weatherModel.dart';
import 'package:section9/services/weatherServices.dart';
import 'package:section9/weatherProviders/weatherProviders.dart';

class SearchPage extends StatelessWidget {
 String? cityName;
 VoidCallback? UpdateUI;
 SearchPage({this.UpdateUI});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search a city Now",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: TextField(
            onChanged: (data){
              cityName=data;
            },

            onSubmitted: (data) async {
              cityName=data;
              weatherServices weatherService=new weatherServices();
              weatherModel? model=  await weatherService.getWeather(cityName: cityName!);
              Provider.of<weatherProviders>(context,listen: false).weatherData=model;
              Provider.of<weatherProviders>(context,listen: false).cityName=cityName;

              //   UpdateUI!();
              Navigator.pop(context);
            },
             decoration: InputDecoration(
               contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 24),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(15),
               ),
               labelText: "Enter a city",
               suffixIcon: GestureDetector(
                 onTap: () async {
                  // cityName=data;
                   weatherServices weatherService=new weatherServices();
                   weatherModel? model=  await weatherService.getWeather(cityName: cityName!);
                   Provider.of<weatherProviders>(context,listen: false).weatherData=model;
                   Provider.of<weatherProviders>(context,listen: false).cityName=cityName;

                   //   UpdateUI!();
                   Navigator.pop(context);
                 },
                 child: Icon(
                   Icons.search,
                 ),
               )

             ),

          ),
        ),
      ),

    );
  }
}
