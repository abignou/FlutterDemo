import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      color: Colors.white,
      child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.red,
          elevation: 5,
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Stack(
            children: [
              getImage(),
              Column(
                children: [
                  Expanded(flex: 2, child: getTitle()),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [getExploreButton()],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }

  getImage() {
    return Image.asset(
      'assets/images/exploreOyoHotels1.jpeg',
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    );
  }

  getTitle() {
    return Center(
      child: Text(
        "Discover More in in\nMumbai",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
      ),
    );
  }

  getExploreButton() {
    return TextButton(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          primary: Colors.blue,
          textStyle: const TextStyle(fontSize: 15),
          backgroundColor: Colors.white),
      onPressed: () {},
      child: const Text('Explore'),
    );
  }
}
