import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      width: double.infinity,
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: index == 5 - 1 ? 15.0 : 0.0,
              ),
              child: getService());
        },
        itemCount: 5,
      ),
    );
  }

  getService() {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                  image: AssetImage('assets/images/exploreOyoHotels1.jpeg'), fit: BoxFit.fill)),
        ),
        Container(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              Text(
                'Special Assistance',
                style: TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              SizedBox(height: 20),
            ],
          ),
        )
      ],
    );
  }
}
