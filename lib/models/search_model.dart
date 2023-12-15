import 'package:zayat/models/all_post.dart';
import 'package:zayat/models/channel_model.dart';

class SearchModel {
  List<Channel>? channelResponses;
  List<Posts>? postResponses;

  SearchModel({this.channelResponses, this.postResponses});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json["channelResponses"] is List) {
      channelResponses = json["channelResponses"] == null
          ? null
          : (json["channelResponses"] as List)
              .map((e) => Channel.fromJson(e))
              .toList();
    }
    if (json["postResponses"] is List) {
      postResponses = json["postResponses"] == null
          ? null
          : (json["postResponses"] as List)
              .map((e) => Posts.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (channelResponses != null) {
      data["channelResponses"] =
          channelResponses?.map((e) => e.toJson()).toList();
    }
    if (postResponses != null) {
      data["postResponses"] = postResponses?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class PostResponses {
  int? postId;
  String? postText;
  List<String>? mediaLocation;
  String? createDate;
  String? channelName;
  int? chanelId;
  String? channelProfilePicture;
  int? likeCount;
  int? unlikeCount;
  int? viewCount;

  PostResponses(
      {this.postId,
      this.postText,
      this.mediaLocation,
      this.createDate,
      this.channelName,
      this.chanelId,
      this.channelProfilePicture,
      this.likeCount,
      this.unlikeCount,
      this.viewCount});

  PostResponses.fromJson(Map<String, dynamic> json) {
    if (json["postId"] is int) {
      postId = json["postId"];
    }
    if (json["postText"] is String) {
      postText = json["postText"];
    }
    if (json["mediaLocation"] is List) {
      mediaLocation = json["mediaLocation"] == null
          ? null
          : List<String>.from(json["mediaLocation"]);
    }
    if (json["createDate"] is String) {
      createDate = json["createDate"];
    }
    if (json["channelName"] is String) {
      channelName = json["channelName"];
    }
    if (json["chanelId"] is int) {
      chanelId = json["chanelId"];
    }
    if (json["channelProfilePicture"] is String) {
      channelProfilePicture = json["channelProfilePicture"];
    }
    if (json["likeCount"] is int) {
      likeCount = json["likeCount"];
    }
    if (json["unlikeCount"] is int) {
      unlikeCount = json["unlikeCount"];
    }
    if (json["viewCount"] is int) {
      viewCount = json["viewCount"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["postId"] = postId;
    data["postText"] = postText;
    if (mediaLocation != null) {
      data["mediaLocation"] = mediaLocation;
    }
    data["createDate"] = createDate;
    data["channelName"] = channelName;
    data["chanelId"] = chanelId;
    data["channelProfilePicture"] = channelProfilePicture;
    data["likeCount"] = likeCount;
    data["unlikeCount"] = unlikeCount;
    data["viewCount"] = viewCount;
    return data;
  }
}

class ChannelResponses {
  int? channelId;
  String? channelName;
  String? channelUrl;
  String? description;
  String? profilePicture;
  String? coverPhoto;

  ChannelResponses(
      {this.channelId,
      this.channelName,
      this.channelUrl,
      this.description,
      this.profilePicture,
      this.coverPhoto});

  ChannelResponses.fromJson(Map<String, dynamic> json) {
    if (json["channelId"] is int) {
      channelId = json["channelId"];
    }
    if (json["channelName"] is String) {
      channelName = json["channelName"];
    }
    if (json["channelUrl"] is String) {
      channelUrl = json["channelUrl"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["profilePicture"] is String) {
      profilePicture = json["profilePicture"];
    }
    if (json["coverPhoto"] is String) {
      coverPhoto = json["coverPhoto"];
    }
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
