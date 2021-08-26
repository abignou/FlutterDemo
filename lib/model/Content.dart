class Content {
  String? actionTitle;
  String? icon;
  String? subTitle;
  String? title;

  Content({
    this.actionTitle,
    this.icon,
    this.subTitle,
    this.title,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      actionTitle: json['actionTitle'] ?? "",
      icon: json['icon'] != null ? (json['icon'] as String) : "",
      subTitle: json['subTitle'] != null ? (json['subTitle'] as String) : "",
      title: json['title'] != null ? (json['title'] as String) : "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actionTitle'] = this.actionTitle;
    data['icon'] = this.icon;
    data['subTitle'] = this.subTitle;
    data['title'] = this.title;
    return data;
  }
}
