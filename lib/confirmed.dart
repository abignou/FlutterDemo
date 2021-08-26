import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Confirmed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 20,
              ),
              FlatButton(
                color: Colors.white,
                padding: EdgeInsets.all(24),
                onPressed: () {},
                child: buildAirportSelector("Indigo Airlines 6E-2423",
                    "PNR-VWU23k", Icons.flight_takeoff),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAirportSelector(walk, experience, IconData flight_takeoff) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
              width: 60,
              child: Icon(Icons.airplanemode_active),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  walk,
                ),
                Text(
                  experience,
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 15,0  ,0),
          width: 90,
          child: Text(
            "Confirmed",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
