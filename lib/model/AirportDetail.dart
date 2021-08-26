import 'Content.dart';
import 'FlightInfo.dart';

class AirportDetail {
  String actionTitle;
  int column;
  List<Content> content;
  // List<String> strContent;
  List<FlightInfo> flightInfo;
  String icon;
  String layout;
  String leftHeader;
  String leftSubHeader;
  String rightHeader;
  String subTitle;
  String title;
  String type;

  AirportDetail(
      {required this.actionTitle,
      required this.column,
      required this.content,
      // required this.strContent,
      required this.flightInfo,
      required this.icon,
      required this.layout,
      required this.leftHeader,
      required this.leftSubHeader,
      required this.rightHeader,
      required this.subTitle,
      required this.title,
      required this.type});

  factory AirportDetail.fromJson(Map<String, dynamic> json) {
    return AirportDetail(
      actionTitle: json['actionTitle'] ?? "",
      column: json['column'] ?? 0,
      content: json['content'] != null
          ? (json['content'] as List).map((i) => Content.fromJson(i)).toList()
          : [],

      // content: json['content'] != null
      //     ? List<Content>.from((json['content'] as Iterable<dynamic>)
      //         .map<dynamic>((dynamic object) {
      //         if (object is Map<String, dynamic>) {
      //           return Content.fromJson(object);
      //         }
      //       }))
      //     : <Content>[],
      // strContent: json['content'] != null
      //     ? List<String>.from(
      //         (json['content'] as Iterable<dynamic>).map<dynamic>((object) {
      //         if (object is String) {
      //           return object;
      //         }
      //       }))
      //     : <String>[],
      // content: json['content'] != null ? <Content>[] : <Content>[],
      // strContent: json['content'] != null ? <String>[] : <String>[],

      flightInfo: json['flightInfo'] != null
          ? (json['flightInfo'] as List)
              .map((i) => FlightInfo.fromJson(i))
              .toList()
          : [],
      icon: json['icon'] != null ? (json['icon'] as String) : "",
      layout: json['layout'] != null ? (json['layout'] as String) : "",
      leftHeader:
          json['leftHeader'] != null ? (json['leftHeader'] as String) : "",
      leftSubHeader: json['leftSubHeader'] != null
          ? (json['leftSubHeader'] as String)
          : "",
      rightHeader:
          json['rightHeader'] != null ? (json['rightHeader'] as String) : "",
      subTitle: json['subTitle'] != null ? (json['subTitle'] as String) : "",
      title: json['title'] != null ? (json['title'] as String) : "",
      type: json['type'] != null ? (json['type'] as String) : "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actionTitle'] = this.actionTitle;
    data['column'] = this.column;
    data['icon'] = this.icon;
    data['layout'] = this.layout;
    data['leftHeader'] = this.leftHeader;
    data['leftSubHeader'] = this.leftSubHeader;
    data['rightHeader'] = this.rightHeader;
    data['subTitle'] = this.subTitle;
    data['title'] = this.title;
    data['type'] = this.type;

    if (this.content != null) {
      data['content'] = this.content.map((v) => v.toJson()).toList();
    }
    // if (this.strContent != null) {
    //   data['strContent'] = this.strContent.map((v) => v).toList();
    // }
    if (this.flightInfo != null) {
      data['flightInfo'] = this.flightInfo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
