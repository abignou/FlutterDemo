import 'package:flutter/material.dart';

class Partners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      // color: Colors.green,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
                left: 15.0,
                right: index == 5 - 1 ? 15.0 : 0.0,
                top: 10,
                bottom: 25),
            child: Partner(),
          );
        },
        itemCount: 5,
      ),
    );
  }
}

class Partner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      // color: Colors.red,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        width: 230,
        // color: Colors.white,
        child: Column(
          children: [getImage(), getDetail()],
        ),
      ),
    );
  }

  getImage() {
    return Image.asset(
      'assets/images/exploreOyoHotels1.jpeg',
      width: double.infinity,
      height: 200,
      fit: BoxFit.fill,
    );
  }

  getDetail() {
    return Column(
      children: [
        getHeader(),
        getTitle(),
        SizedBox(height: 10),
        getDescription()
      ],
    );
  }

  getHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
      height: 40,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        "Sponsored",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.greenAccent,
          fontSize: 14,
        ),
      ),
    );
  }

  getTitle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
      child: Text(
        "Luxury shopping at tax absorbed prices",
        textAlign: TextAlign.left,
        maxLines: 2,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
      ),
    );
  }

  getDescription() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
      child: Text(
        "nhbfkhsdbfjhds fhfgf  j hfgf  fg gf shfgjf jhdshgsgfd jd ssd fgfh dsj gfjs dgf",
        textAlign: TextAlign.left,
        maxLines: 3,
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
    );
  }
}
