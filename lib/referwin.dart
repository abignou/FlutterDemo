import 'package:flutter/material.dart';

class ReferWin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child:  Text("Refer & Win",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              height: 1.5,
              fontSize: 22,
            ),
          )
         ),
          Align(alignment: Alignment.centerLeft,
          child: Text(
            "Lorem Ipsum is simply a dummy text of the printing and typesetting industry Lorem Ipsum is simply a dummy text of the printing and typesetting industry Lorem Ipsum is simply a dummy text of the printing and typesetting industry",
            textAlign: TextAlign.left,
            style: TextStyle(height: 1.8),
          ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/main.png",
                    ),
                    fit: BoxFit.contain)),
            height: MediaQuery.of(context).size.height * .45,
          )
        ],
      ),
    );
  }
}
