import 'package:flutter/material.dart';
import 'partners.dart';


class ExclusivePartners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      color: Colors.white,
      child: Column(
        children: [getHeader(), Partners()],
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
        "Exclusive Partners",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 17,
        ),
      ),
    );
  }
}
