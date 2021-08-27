import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterscreen/AdaniAirport.dart';
import 'package:flutterscreen/BuildWidgetCartegory.dart';
import 'package:flutterscreen/FlightCard.dart';
import 'package:flutterscreen/NearByGateways.dart';
import 'package:flutterscreen/exclusive_partners.dart';
import 'package:flutterscreen/experience.dart';
import 'package:flutterscreen/explore.dart';
import 'package:flutterscreen/model/Airport.dart';
import 'package:flutterscreen/model/ListItem.dart';
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
    print("Rohit1");
    String data = await rootBundle.loadString("assets/json/airport.json");
    Map<String, dynamic> userMap = jsonDecode(data);
    var airport = Airport.fromJson(userMap);
    print("FIRST $airport");
    print("Rohit");
    return airport;
  }

  var airPortName = 'Mumbai';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: projectWidget(),
    );
  }

  void _showBottomSheet(BuildContext context) {
    List<ListItem> myList = <ListItem>[];
    myList.add(ListItem(1, "Delhi"));
    myList.add(ListItem(2, "Ahmedabad"));
    myList.add(ListItem(3, "Goa"));
    myList.add(ListItem(4, "Mumbai"));
    myList.add(ListItem(5, "Lucknow"));
    myList.add(ListItem(6, "Bangalore"));
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {
                print(myList.length);
                Navigator.of(context).pop();
              },
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.75,
                builder: (_, controller) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.grey[600],
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: controller,
                            itemCount: myList.length,
                            itemBuilder: (_, index) {
                              return ElevatedButton(
                                child: Text(
                                  myList[index].name,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                onPressed: () {
                                  selectedAirport(title: myList[index].name);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  elevation: 5,
                                ),
                              );
                              /*return Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(myList[index].name),
                                ),
                              );*/
                              /*onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(title:myList[index].name)));

                                HomeScreen(title:myList[index].name);
                                Navigator.of(context).pop();
                                print("Click event on Container"+myList[index].name);
                              },
                            );*/
                              /*return Card(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(myList[index].name),
                              ),
                            );*/
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void selectedAirport({required String title}) {
    setState(() {
      airPortName = title;
    });
  }

  Widget projectWidget() {
    return FutureBuilder(
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == null) {
          return Text("Loading");
        } else {
          return ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              var airport = snapshot.data as Airport;
              print(airport.airportDetail[index].type);
              if (index == 0) {
                return Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/mumbai_airport.png"),
                              fit: BoxFit.cover)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Chhatrapati Shivaji Internation Airport",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                CircleAvatar(
                                  radius: 21,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://lh3.googleusercontent.com/a-/AAuE7mChgTiAe-N8ibcM3fB_qvGdl2vQ9jvjYv0iOOjB=s96-c'),
                                      radius: 20.0),
                                )
                              ]),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: new GestureDetector(
                              onTap: () {
                                _showBottomSheet(context);
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: airPortName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 22,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 15),
                                hintText: 'Search',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                suffixIcon: Icon(Icons.mic, color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(8),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                            ),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              }
              if (index == 1) {
                print("ad"+airport.airportDetail[0].flightInfo[0].destinationCode);
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
                return Experience();
              }
              if (index == 4) {
                return BuildWidgetCategory();
              }

              if (index == 5) {
                return Column(children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 280,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Your Safety : our priority",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "See All",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ]),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "COVID 19 Information",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            child: Container(
                                padding: EdgeInsets.all(2),
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 200,
                                            child: Column(children: <Widget>[
                                              Text(
                                                "Negative RT-PCR Certificates",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                  "\nDummy Text,Dummy Text,Dummy Text,Dummy Text,Dummy Text,Dummy Text",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                  ),
                                                  textAlign: TextAlign.left),
                                              Text(
                                                "Read more ",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.blue,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            ]),
                                          ),
                                        ]),
                                    Image.asset(
                                      "assets/images/ic_car.png",
                                      width: 50,
                                      height: 50,
                                      alignment: Alignment.topRight,
                                    ),
                                  ],
                                )),
                            elevation: 0,
                          ),
                        )),
                      ]),
                    ),
                  ),
                ]);
              }
              if (index == 6) {
                return Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 260,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Offers & Discount",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  "See All",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ]),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 15,
                              itemBuilder: (BuildContext context, int index) =>
                                  Card(
                                child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                      const Color(0xFF448041),
                                      const Color(0xFF85a655),
                                    ])),
                                    width: 320,
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Text(
                                                  "book \n a cab",
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 0, 0, 0),
                                                child: Text(
                                                  "get 10% off upto  \u20B9 100",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 2, 0, 0),
                                                child: TextButton(
                                                  style: ButtonStyle(
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.white),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.black),
                                                    padding:
                                                        MaterialStateProperty
                                                            .all<EdgeInsets>(
                                                                EdgeInsets.all(
                                                                    10)),
                                                  ),
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Book Now'.toUpperCase(),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                        Image.asset("assets/images/ic_car.png",
                                            color: Colors.white),
                                      ],
                                    )),
                                margin: EdgeInsets.fromLTRB(0, 20, 10, 20),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              }
              if (index == 7) {
                return Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Last min.Deals",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  "See All",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ]),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) =>
                                  Card(
                                child: Container(
                                  width: 200,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/images/ic_car.png",
                                          alignment: Alignment.center,
                                        ),
                                        Container(
                                          width: 160,
                                          alignment: Alignment.topLeft,
                                          margin:
                                              EdgeInsets.fromLTRB(0, 5, 0, 0),
                                          child: Column(children: <Widget>[
                                            Align(
                                              child: Text(
                                                "Add here product name-currently have offer",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              alignment: Alignment.topLeft,
                                            ),
                                            Align(
                                              child: Text.rich(
                                                TextSpan(
                                                  text: 'MRP',
                                                  children: <TextSpan>[
                                                    new TextSpan(
                                                      text: ' \u20B9 100 ',
                                                      style: new TextStyle(
                                                        color: Colors.grey,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              alignment: Alignment.topLeft,
                                            ),
                                            Row(children: <Widget>[
                                              Text("\u20B9 100",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                  textAlign: TextAlign.left),
                                              SizedBox(width: 10.0),
                                              Text("20% off",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.green,
                                                  ),
                                                  textAlign: TextAlign.center),
                                            ]),
                                          ]),
                                        ),
                                      ]),
                                ),
                                margin: EdgeInsets.fromLTRB(0, 20, 10, 20),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              }
              if (index == 8) {
                return ExclusivePartners();
              }

              if (index == 9) {
                return MoreServices();
              }
              if (index == 10) {
                return Column(
                  children: <Widget>[NearByGateways()],
                );
              }
              if (index == 11) {
                return Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                        child: Column(
                          children: <Widget>[
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Discover with Adani",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ]),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4),
                                itemBuilder: (_, index) => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://lh3.googleusercontent.com/a-/AAuE7mChgTiAe-N8ibcM3fB_qvGdl2vQ9jvjYv0iOOjB=s96-c'),
                                        radius: 30.0),
                                    Text(
                                      "Title",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                itemCount: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (index == 12) {
                return Explore();
              }

              if (index == 13) {
                return Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Get 2 - minute Digital Approval ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ]),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) =>
                                  Card(
                                child: Container(
                                  width: 350,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          width: 200,
                                          alignment: Alignment.topLeft,
                                          margin:
                                              EdgeInsets.fromLTRB(0, 5, 0, 0),
                                          child: Column(children: <Widget>[
                                            Align(
                                              child: Text(
                                                "Loyality Card",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              alignment: Alignment.topLeft,
                                            ),
                                            Align(
                                              child: Text(
                                                "Get reward worth \u20B9 2000 on your adani card",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              alignment: Alignment.topLeft,
                                            ),
                                            Align(
                                              child: Text(
                                                "Know More".toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blue,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              alignment: Alignment.topLeft,
                                            ),
                                          ]),
                                        ),
                                        Image.asset(
                                          "assets/images/ic_card.png",
                                          alignment: Alignment.center,
                                          width: 120,
                                        ),
                                      ]),
                                ),
                                margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              }
              if (index == 14) {
                return ReferWin();
              }
              return Text('');
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
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        body: Center(
      child: Text('Category Screen'),
    ));
  }
}
