import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Confirmed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        // color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: TextButton(
            // color: Colors.blue,
            onPressed: () {},
            child: buildAirportSelector(
                "Indigo Airlines 6E-2423", "PNR-VWU23k", Icons.flight_takeoff),
          ),
        ),
      ),
    );
  }

  Widget buildAirportSelector(walk, experience, IconData flightTakeoff) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              // width: 60,
              child: Icon(Icons.airplanemode_active,color: Colors.black,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  walk,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  experience,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          // margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          // width: 90,
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
