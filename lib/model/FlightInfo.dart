class FlightInfo {
  String destinationCode;
  String destinationDate;
  String destinationName;
  String destinationTerminal;
  String destinationTime;
  String duration;
  String flightIcon;
  String originCode;
  String originDate;
  String originName;
  String originTerminal;
  String originTime;
  String status;
  String stop;
  String subTitle;
  String title;

  FlightInfo(
      {required this.destinationCode,
      required this.destinationDate,
      required this.destinationName,
      required this.destinationTerminal,
      required this.destinationTime,
      required this.duration,
      required this.flightIcon,
      required this.originCode,
      required this.originDate,
      required this.originName,
      required this.originTerminal,
      required this.originTime,
      required this.status,
      required this.stop,
      required this.subTitle,
      required this.title});

  factory FlightInfo.fromJson(Map<String, dynamic> json) {
    return FlightInfo(
      destinationCode: json['destinationCode'] != null
          ? (json['destinationCode'] as String)
          : "",
      destinationDate: json['destinationDate'] != null
          ? (json['destinationDate'] as String)
          : "",
      destinationName: json['destinationName'] != null
          ? (json['destinationName'] as String)
          : "",
      destinationTerminal: json['destinationTerminal'] != null
          ? (json['destinationTerminal'] as String)
          : "",
      destinationTime: json['destinationTime'] != null
          ? (json['destinationTime'] as String)
          : "",
      duration: json['duration'] != null ? (json['duration'] as String) : "",
      flightIcon:
          json['flightIcon'] != null ? (json['flightIcon'] as String) : "",
      originCode:
          json['originCode'] != null ? (json['originCode'] as String) : "",
      originDate:
          json['originDate'] != null ? (json['originDate'] as String) : "",
      originName:
          json['originName'] != null ? (json['originName'] as String) : "",
      originTerminal: json['originTerminal'] != null
          ? (json['originTerminal'] as String)
          : "",
      originTime:
          json['originTime'] != null ? (json['originTime'] as String) : "",
      status: json['status'] != null ? (json['status'] as String) : "",
      stop: json['stop'] != null ? (json['stop'] as String) : "",
      subTitle: json['subTitle'] != null ? (json['subTitle'] as String) : "",
      title: json['title'] != null ? (json['title'] as String) : "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['destinationCode'] = this.destinationCode;
    data['destinationDate'] = this.destinationDate;
    data['destinationName'] = this.destinationName;
    data['destinationTerminal'] = this.destinationTerminal;
    data['destinationTime'] = this.destinationTime;
    data['duration'] = this.duration;
    data['flightIcon'] = this.flightIcon;
    data['originCode'] = this.originCode;
    data['originDate'] = this.originDate;
    data['originName'] = this.originName;
    data['originTerminal'] = this.originTerminal;
    data['originTime'] = this.originTime;
    data['status'] = this.status;
    data['stop'] = this.stop;
    data['subTitle'] = this.subTitle;
    data['title'] = this.title;
    return data;
  }
}
