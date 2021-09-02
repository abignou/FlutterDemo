import 'package:flutter/material.dart';
import 'package:flutterscreen/confirmed.dart';
import 'package:flutterscreen/model/AirportDetail.dart';
import 'package:flutterscreen/model/ListItem.dart';
class HomeStateTopElement extends StatefulWidget{
  @override
  _HomeStateTopElementState createState() => _HomeStateTopElementState();
}

class _HomeStateTopElementState extends State<HomeStateTopElement> {
  var airPortName = 'Mumbai';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/mumbai_airport.png"),
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
}

class CustomerSafetyDesc extends StatelessWidget{
  final AirportDetail covidinfo;
  CustomerSafetyDesc({
    required this.covidinfo
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
    Container(
      width: double.infinity,
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: <Widget>[
          setHeader(covidinfo.leftHeader, covidinfo.rightHeader),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              covidinfo.leftSubHeader,
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
                itemCount: covidinfo.content.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Container(
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  child: Column(children: <Widget>[
                                    Text(
                                      covidinfo.content[index].title!,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                        covidinfo.content[index].subTitle!,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                        textAlign: TextAlign.left),
                                    Align(child: Text(
                                      covidinfo.content[index].actionTitle!,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),alignment: Alignment.centerLeft,),
                                  ],),
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
                  elevation: 0.5,

                ),
              )),
        ]),
      ),
    )]);
  }

}
class OffernDiscount extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: double.infinity,
        height: 260,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: <Widget>[
            setHeader("Offers & Discount", "See All"),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => Card(
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
                                  padding:
                                  EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                                  padding:
                                  EdgeInsets.fromLTRB(10, 2, 0, 0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                      MaterialStateProperty.all<
                                          Color>(Colors.white),
                                      backgroundColor:
                                      MaterialStateProperty.all<
                                          Color>(Colors.black),
                                      padding: MaterialStateProperty
                                          .all<EdgeInsets>(
                                          EdgeInsets.all(10)),
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
      );
  }

}
class LastMinDeals extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: double.infinity,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: <Widget>[
            setHeader("Last min. Deals", "See All"),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/ic_car.png",
                            alignment: Alignment.center,
                          ),
                          Container(
                            width: 160,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                                          decoration: TextDecoration
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
      );
  }
}
class DiscoverWithAdani extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
          padding: const EdgeInsets.all(15.0),
    child:  Wrap(
      children: <Widget>[
        setHeader("Discover with Adani", ""),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
            itemCount: 8,
          ),
        ),
      ],
    )
    )]);
  }
}
class Get2MinDigitalApproval extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: <Widget>[
          setHeader("Get 2 - minute Digital Approval ", ""),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Card(
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
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
    );
  }

}
setHeader(String leftContent, String rightContent) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          leftContent,
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          rightContent,
          style: TextStyle(
            fontSize: 15,
            color: Colors.blue,
          ),
          textAlign: TextAlign.right,
        ),
      ]);

}