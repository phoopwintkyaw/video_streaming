import 'dart:convert';

class PostModel {
  final int postId;
  final String postText;
  final List<String> mediaLocation;
  final String createDate;
  final String channelName;
  final String chanelId;
  final String channelProfilePicture;
  final String likeCount;
  final String unlikeCount;
  final String viewCount;
  PostModel({
    required this.postId,
    required this.postText,
    required this.mediaLocation,
    required this.createDate,
    required this.channelName,
    required this.chanelId,
    required this.channelProfilePicture,
    required this.likeCount,
    required this.unlikeCount,
    required this.viewCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'postText': postText,
      'mediaLocation': mediaLocation,
      'createDate': createDate,
      'channelName': channelName,
      'chanelId': chanelId,
      'channelProfilePicture': channelProfilePicture,
      'likeCount': likeCount,
      'unlikeCount': unlikeCount,
      'viewCount': viewCount,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postId: map['postId'] as int,
      postText: map['postText'] as String,
      mediaLocation: List<String>.from((map['mediaLocation'] as List<String>)),
      createDate: map['createDate'] as String,
      channelName: map['channelName'] as String,
      chanelId: map['chanelId'] as String,
      channelProfilePicture: map['channelProfilePicture'] as String,
      likeCount: map['likeCount'] as String,
      unlikeCount: map['unlikeCount'] as String,
      viewCount: map['viewCount'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
