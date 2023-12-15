class ApiConst {
  static const String endPoint = 'https://natboun.com/api';
  static const String allChannels = '/channel/all';
  static const String aboutUs = '/v1/aboutUs/1';
  static const String allPosts = '/v1/post/all';
  static const String channelDetail = '/channel/view/{channelId}';
  static const String channelPost = '/v1/post/channel/{channelId}/posts';
  static const String search = '/channel/mobile/search';
  static const String feed = '/v1/post/new';
  static const String likePost = '/v1/post/like-post/{postId}';
  static const String cancelLikePost = '/v1/post/cancel-like-post/{postId}';
  static const String unlikePost = '/v1/post/unlike-post/{postId}';
  static const String cancelUnlikePost = '/v1/post/cancel-unlike-post/{postId}';
  static const String viewPost = '/v1/post/count-view-post/{postId}';
}
