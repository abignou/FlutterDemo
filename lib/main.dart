import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterscreen/AdaniAirport.dart';
import 'package:flutterscreen/BuildWidgetCategory.dart';
import 'package:flutterscreen/FlightCard.dart';
import 'package:flutterscreen/Homestateelement/HomestateListElement.dart';
import 'package:flutterscreen/NearByGateways.dart';
import 'package:flutterscreen/exclusive_partners.dart';
import 'package:flutterscreen/experience.dart';
import 'package:flutterscreen/explore.dart';
import 'package:flutterscreen/model/Airport.dart';
import 'package:flutterscreen/more_services.dart';
import 'package:flutterscreen/referwin.dart';

void main() {
  runApp(MyApp());
  // loadJson();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Super App'),
    );
  }
}

loadJson() async {
  // String data = await rootBundle.loadString('assets/json/airport.json');
  // var jsonResult = json.decode(data);
  // var jsonAirport = json.decode(jsonResult);
  // print(jsonResult);
  // print(jsonAirport);

  /* String data = await DefaultAssetBundle.of(context)
      .loadString("assets/flight_details.json");
  Map<String, dynamic> userMap = jsonDecode(data);
  print(data.toString());
  var flightDetails = Airport.fromJson(userMap);*/
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _pageIndex = [
    HomeScreen(title: 'Mumbai'),
    CategoryScreen(),
    CategoryScreen(),
    CategoryScreen(),
    CategoryScreen(),
    CategoryScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageIndex[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_sharp),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Future abc() async {
    String data = await rootBundle.loadString("assets/json/airport.json");
    Map<String, dynamic> userMap = jsonDecode(data);
    var airport = Airport.fromJson(userMap);
    return airport;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: projectWidget(),
    );
  }

  Widget projectWidget() {
    return FutureBuilder(
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == null) {
          return Text("Loading");
        } else {
          var airport = snapshot.data as Airport;
          return ListView.builder(
            itemCount: airport.airportDetail.length,
            itemBuilder: (BuildContext context, int index) {
              var airport = snapshot.data as Airport;
              print(airport.airportDetail[index].type);
              if (index == 0) {
                return Column(
                  children: <Widget>[HomeStateTopElement()],
                );
              }
              if (index == 1) {
                print("ad" +
                    airport.airportDetail[0].flightInfo[0].destinationCode);
                return FlightCard(
                  isClickable: false,
                  fullName: 'Rohit',
                  flightInfo: airport.airportDetail[0].flightInfo,
                );
              }

              if (index == 2) {
                return AdaniAirport();
              }

              if (index == 3) {
                return Experience(airportDetailinfo: airport.airportDetail[2]);
              }
              if (index == 4) {
                return BuildWidgetCategory();
              }

              if (index == 5) {
                // return Column(children: <Widget>[
                 return CustomerSafetyDesc(covidInfo: airport.airportDetail[4]);
                // ]);
              }
              if (index == 6) {
                return Column(
                  children: <Widget>[
                    OffersAndDiscount(),
                  ],
                );
              }
              if (index == 7) {
                return Column(
                  children: <Widget>[
                    LastMinDeals(),
                  ],
                );
              }
              if (index == 8) {
                return ExclusivePartners();
              }

              if (index == 9) {
                // more services abdul
                return MoreServices();
              }
              if (index == 10) {
                return Column(
                  children: <Widget>[NearByGateways()],
                );
              }
              if (index == 11) {
                return DiscoverWithAdani();

              }
              if (index == 12) {
                // explore abdul
                return Explore();
              }
              if (index == 13) {
                return Column(
                  children: <Widget>[
                    Get2MinDigitalApproval(),
                  ],
                );
              }
              if (index == 14) {
                return Column(
                  children: <Widget>[ReferWin()],
                );
              }
              return Text('Item :'+airport.airportDetail[index].type);
            },
          );
        }
      },
      future: abc(),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
      child: Text('Category Screen'),
    ));
  }
}
