import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterscreen/confirmed.dart';

class FlightCard extends StatelessWidget {
  final String fullName;
  final bool isClickable;

  FlightCard({required this.fullName, required this.isClickable});

  _cityStyle(code, cityName, time, date) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            code,
            style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            cityName,
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            time,
            style: TextStyle(color: Colors.grey, fontSize: 20.0),
          ),
          Text(
            date,
            style: TextStyle(color: Colors.grey, fontSize: 14.0),
          )
        ],
      ),
    );
  }

  _boardingStyle(text) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(Icons.airplanemode_active),
          Text(
            text,
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Confirmed(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _cityStyle("BOM", "Mumbai (T1)", "12:35", "Mon, 24 Aug"),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 15,
                                height: 1,
                                color: Colors.grey,
                              ),
                              Text(
                                "1 hr 50 Min",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 15.0),
                              ),
                              Container(
                                width: 15,
                                height: 1,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Text(
                            "Non - Stop",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                    _cityStyle("BLR", "Bengaluru (T1)", "14:06", "Mon, 24 Aug"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlightDetailChip(Icons.calendar_today, 'GetBoardingPass'),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey,
                    ),
                    FlightDetailChip(Icons.calendar_today, 'WebCheckIn'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FlightDetailChip extends StatelessWidget {
  final IconData iconData;
  final String label;

  FlightDetailChip(this.iconData, this.label);

  @override
  Widget build(BuildContext context) {
    final Color chipBackgroundColor = Color(0x00000000);

    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black, fontSize: 14.0),
      backgroundColor: Colors.black.withOpacity(0.0),
      avatar: Icon(
        iconData,
        size: 14.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }
}
