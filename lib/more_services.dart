import 'package:flutter/material.dart';
import 'package:flutterscreen/services.dart';

class MoreServices extends StatelessWidget {
  const MoreServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.redAccent,
      child: Column(
        children: [getHeader(), Services()],
      ),
    );
  }

  getHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15),
      height: 50,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        "More Services",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 17,
        ),
      ),
    );
  }
}
