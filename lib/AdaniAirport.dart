import 'package:flutter/material.dart';

class AdaniAirport extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: buildAirportSelector(
                    "Airport Walk","Experience the adani Airport",
                    Icons.flight_takeoff),

              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAirportSelector(walk,experience, IconData flightTakeoff) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 0  ,30,0),
              width: 60,
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
          width: 20,
          padding: EdgeInsets.all(30),
          child: Icon(Icons.airplanemode_active,color: Colors.black,),
        ),
      ],
    );
  }

}