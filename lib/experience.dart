import 'package:flutter/material.dart';
import 'package:flutterscreen/model/AirportDetail.dart';

class Experience extends StatelessWidget {
  final AirportDetail airportDetailinfo;
  Experience({
  required this.airportDetailinfo
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
    Padding(
    padding: const EdgeInsets.all(15.0),
      child: Wrap(children: <Widget>[

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      airportDetailinfo.leftHeader,
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
              SizedBox(height: 15),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: airportDetailinfo.column),
                  itemBuilder: (_, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage: AssetImage(airportDetailinfo.content[index].icon!),
                          radius: 25.0),
                      /*Container(width: 60,
                      height: 60,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Image(
                          image: AssetImage('assets/images/abuja.png'), fit: BoxFit.contain),
                    ),*/
                      SizedBox(height: 5),
                      Text(airportDetailinfo.content[index].title!),
                      SizedBox(height: 5)
                    ],
                  ),
                  itemCount: airportDetailinfo.content.length,
                ),
              ),
            ],
          )
    )
    ]
        );
  }
}
