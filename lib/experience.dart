import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        width: double.infinity,
        height: 220,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Experiences",
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (_, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage: AssetImage('assets/images/blow.png'),
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
                      Text("Shopping"),
                      SizedBox(height: 5)
                    ],
                  ),
                  itemCount: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
