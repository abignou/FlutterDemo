
import 'package:flutter/material.dart';
import 'package:flutterscreen/model/Category.dart';

class BuildWidgetCategory extends StatelessWidget {
  static const primaryDarkColor = Colors.grey;

  var listCategories = [
    Category(
        title: 'Baggage Information'),
    Category(
        title: 'Deals & Offers'),
    Category(
        title: 'Car Parking'),
    Category(
        title: 'Tracking'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var category = listCategories[index];
          return Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: index == listCategories.length - 1 ? 16.0 : 0.0,
            ),
            child: Container(
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: primaryDarkColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      category.title,
                      style: Theme.of(context).textTheme.body1!.merge(
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: listCategories.length,
      ),
    );
  }
}
