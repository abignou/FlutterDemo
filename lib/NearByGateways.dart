import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterscreen/model/NearByGatewayModel.dart';

class NearByGateways extends StatelessWidget {
  static const primaryDarkColor = Colors.grey;
  var gatewaysCategories = [
    NearBygatewayModel(
        image: 'wee',
        hotelName: 'Taj Holiday Inn',
        hotelAddress: 'Gurugram',
        discountPrice: '8000',
        hotelPrice: '4700',
        perMember: '+506 item | per night'),
    NearBygatewayModel(
        image: 'wee',
        hotelName: 'Taj Holiday Inn',
        hotelAddress: 'Gurugram',
        discountPrice: '8000',
        hotelPrice: '4700',
        perMember: '+506 item | per night'),
    NearBygatewayModel(
        image: 'wee',
        hotelName: 'Taj Holiday Inn',
        hotelAddress: 'Gurugram',
        discountPrice: '8000',
        hotelPrice: '4700',
        perMember: '+506 item | per night'),
    NearBygatewayModel(
        image: 'wee',
        hotelName: 'Taj Holiday Inn',
        hotelAddress: 'Gurugram',
        discountPrice: '8000',
        hotelPrice: '4700',
        perMember: '+506 item | per night'),
  ];




  @override
  Widget build(BuildContext context) {
   // Locale locale = Localizations.localeOf(context);
   // final formatCurrency = NumberFormat.simpleCurrency(locale: locale.toString());

    return Container(
      width: double.infinity,
      height: 180.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var category = gatewaysCategories[index];
          return GestureDetector(
            onTap: (){
             // Navigator.push(context, MaterialPageRoute(builder: (context) => SingleHotel()),);
            },
            child: Container(
              width:175,
              height:50,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4)
                      ),
                      child:Container(height:500*0.15,width:200,child: Image.asset('assets/images/exploreOyoHotels1.jpeg',fit: BoxFit.cover,)),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            category.hotelName,
                            style: TextStyle(
                                fontFamily: "poppins-regular",
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 2,),
                          Text(
                            category.hotelAddress,
                            style: TextStyle(
                              fontFamily: "poppins-regular",
                              fontSize: 14,
                              color: Colors.grey,
                              //fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 4,),
                        Row(children: [
                          Text(
                            '\u{20B9}${ category.discountPrice}',
                            style: TextStyle(
                                fontFamily: "poppins-regular",
                                fontSize: 10,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(width: 12,),
                          Text(
                            '\u{20B9}${ category.hotelPrice}',
                            style: TextStyle(
                              fontFamily: "poppins-regular",
                              fontSize: 10,
                              color: Colors.black,
                              //fontWeight: FontWeight.w400
                            ),
                          )
                        ],),
                          SizedBox(height: 3,),
                          Text(
                            category.perMember,
                            style: TextStyle(
                                fontFamily: "poppins-regular",
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: gatewaysCategories.length,
      ),
    );
  }
}
