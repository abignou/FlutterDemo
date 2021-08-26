import 'package:flutterscreen/model/AirportDetail.dart';

class Airport {
  List<AirportDetail> airportDetail;

  Airport({required this.airportDetail});

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      airportDetail: json['airportDetail'] != null
          ? (json['airportDetail'] as List)
              .map((i) => AirportDetail.fromJson(i))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.airportDetail != null) {
      data['airportDetail'] =
          this.airportDetail.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
