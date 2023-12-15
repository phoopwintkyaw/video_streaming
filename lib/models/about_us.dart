class AboutUs {
  int? id;
  String? text;

  AboutUs({this.id, this.text});

  AboutUs.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["text"] is String) {
      text = json["text"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["text"] = text;
    return data;
  }
}
