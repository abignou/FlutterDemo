import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterscreen/model/ListItem.dart';
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
  String data = await rootBundle.loadString('assets/json/airport.json');
  var jsonResult = json.decode(data);
  var jsonAirport = json.decode(jsonResult);
  print(jsonResult);
  print(jsonAirport);
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
 final _pageIndex=[HomeScreen(title: 'Mumbai'),CategoryScreen(),CategoryScreen(),CategoryScreen(),CategoryScreen(),CategoryScreen()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
    body: _pageIndex[_selectedIndex],
      /*body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),*/
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
  const HomeScreen ({ Key? key, required this.title }): super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState(title);
}
class HomeScreenState extends State<HomeScreen> {
  var airPortName='';
  HomeScreenState(String title){
    this.airPortName=title;
    print("airportname::"+airPortName);
  }

  @override
  Widget build (BuildContext context) {
    print("123"+widget.title);
    return new Scaffold(
        body: ListView.builder(
          itemCount: 16,
          itemBuilder: (BuildContext context, int index) {
            if(index==0){
              return Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/mumbai_airport.png"), fit: BoxFit.cover)
                    ),
                    child: Padding(padding: const EdgeInsets.all(15.0),
                      child: Column(children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
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
                          radius: 20.0),)
                  ]),
                        Align(
                          alignment: Alignment.centerLeft,
                            child: new GestureDetector(
                              onTap: () {
                                _showBottomSheet(context);
                                },
                              child:RichText(text: TextSpan(children: [TextSpan(text: widget.title,style:TextStyle(color: Colors.white,fontSize: 20,),),
                              WidgetSpan(
                                child: Icon(Icons.keyboard_arrow_down, size: 22,color: Colors.white,),

                              ),

                            ],
                          ),
                        ),),),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:  BorderRadius.circular(20),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 15),
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search,color: Colors.grey,),
                              suffixIcon: Icon(Icons.mic,color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(8),
                            ),
                            textAlignVertical: TextAlignVertical.center,
                          ),
                          margin: EdgeInsets.fromLTRB(0,10,0,0),
                        ),
                      ]),
                    ),
              ),
                ],
              );
            }
            if(index==6){
              return Column(
                children: <Widget>[
              Container(
              width: double.infinity,
                  height: 280,
                  child: Padding(padding: const EdgeInsets.all(15.0),
                  child: Column(children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
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
                    child:ListView.builder(scrollDirection: Axis.horizontal,itemCount: 5,itemBuilder: (BuildContext context, int index) =>
                        Card(child: Container(
                          padding: EdgeInsets.all(2),margin: EdgeInsets.all(10),child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: <Widget>[
                        Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
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
                                    textAlign: TextAlign.left
                                  ),
                                Text(
                                  "Read more ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ]
                          ),

                          ),]),
                      Image.asset("assets/images/ic_car.png",width: 50,height: 50,alignment: Alignment.topRight,),
                    ],)
                      ),elevation: 0,),
                    )),
                  ]),),
              ),
                ]
              );
            }
            if(index==7){
              return Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 250,
                    child: Padding(padding: const EdgeInsets.all(15.0),
                      child: Column(children: <Widget>[
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
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
                            itemBuilder: (BuildContext context, int index) => Card(
                              child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [const Color(0xFF448041),
                                            const Color(0xFF85a655),])
                                  ),
                                  width:320,padding: EdgeInsets.all(10),child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                                Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                                  Padding(padding: EdgeInsets.all(5.0),
                                    child: Text(
                                  "book \n a cab",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),),
                                Padding(padding: EdgeInsets.fromLTRB(10,0,0,0),
                                  child:Text(
                                    "get 10% off upto  \u20B9 100",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),),
                                Padding(padding: EdgeInsets.fromLTRB(10,2,0,0),
                                    child:TextButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                                    ),
                                    onPressed: () { },
                                    child: Text('Book Now'.toUpperCase(),),
                                  ),
                                ),
                                ]),
                                Image.asset("assets/images/ic_car.png",color: Colors.white),
                              ],)
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
            if(index==8){
              return Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: Padding(padding: const EdgeInsets.all(15.0),
                      child: Column(children: <Widget>[
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
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
                            itemBuilder: (BuildContext context, int index) => Card(
                              child: Container(
                                  width:200,padding: EdgeInsets.all(10),child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
                                  Image.asset("assets/images/ic_car.png",alignment: Alignment.center,),
                                  Container(
                                    width: 160,
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.fromLTRB(0,5,0,0),
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
                                                child: Text.rich(TextSpan(
                                                  text: 'MRP',
                                                  children: <TextSpan>[
                                                    new TextSpan(
                                                      text: ' \u20B9 100 ',
                                                      style: new TextStyle(
                                                        color: Colors.grey,
                                                        decoration: TextDecoration.lineThrough,
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
                                        SizedBox(width:10.0),
                                          Text("20% off",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.green,
                                              ),

                                              textAlign: TextAlign.center),]
                                        ),

                                          ]
                                    ),

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
            if(index==9){
              return Column(
                  children: <Widget>[
                  Container(
                  width: double.infinity,
                  height: 200,
                  child: Padding(padding: const EdgeInsets.fromLTRB(15.0,0,15.0,0),
            child: Column(children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (_, index) => Column(mainAxisAlignment: MainAxisAlignment.center,
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
                ],),
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
            if(index==14){
              return Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 180,
                    child: Padding(padding: const EdgeInsets.all(15.0),
                      child: Column(children: <Widget>[
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
                          Text(
                            "Get 2 - minute Digital Approval ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
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
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) => Card(
                              child: Container(
                                width:350,padding: EdgeInsets.all(10),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
                                Container(
                                  width: 200,
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.fromLTRB(0,5,0,0),
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

                                  ]
                                  ),

                                ),
                                Image.asset("assets/images/ic_card.png",alignment: Alignment.center,width: 120,),
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
            return Text('Item');
          },

        )
    );
  }

}
class CategoryScreen extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        body: Center(
          child: Text('Category Screen'),
        )
    );
  }
}
void _showBottomSheet(BuildContext context) {
  List<ListItem> myList = <ListItem>[];
  myList.add(ListItem(1,"Delhi"));
  myList.add(ListItem(2,"Ahmedabad"));
  myList.add(ListItem(3,"Goa"));
  myList.add(ListItem(4,"Mumbai"));
  myList.add(ListItem(5,"Lucknow"));
  myList.add(ListItem(6,"Bangalore"));
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
            onTap: () {print(myList.length);
            Navigator.of(context).pop();},
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
                              child: Text(myList[index].name,style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),textAlign: TextAlign.start,),
                              onPressed: () => Navigator.pop(context,HomeScreen(title:myList[index].name)),
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
