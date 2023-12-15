class ChannelDetail {
  int? channelId;
  String? channelName;
  String? channelUrl;
  String? description;
  String? profilePicture;
  String? coverPhoto;

  ChannelDetail(
      {this.channelId,
      this.channelName,
      this.channelUrl,
      this.description,
      this.profilePicture,
      this.coverPhoto});

  ChannelDetail.fromJson(Map<String, dynamic> json) {
    channelId = json["channelId"];
    channelName = json["channelName"];
    channelUrl = json["channelUrl"];
    description = json["description"];
    profilePicture = json["profilePicture"];
    coverPhoto = json["coverPhoto"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["channelId"] = channelId;
    data["channelName"] = channelName;
    data["channelUrl"] = channelUrl;
    data["description"] = description;
    data["profilePicture"] = profilePicture;
    data["coverPhoto"] = coverPhoto;
    return data;
  }
}
