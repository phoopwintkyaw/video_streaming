import 'package:retrofit/http.dart';
import 'package:zayat/const/api_const.dart';
import 'package:dio/dio.dart';
import 'package:zayat/models/about_us.dart';
import 'package:zayat/models/all_post.dart';
import 'package:zayat/models/channel_detail.dart';
import 'package:zayat/models/feed_model.dart';
import 'package:zayat/models/post_get_by_channel_id_model.dart';
import 'package:zayat/models/search_model.dart';

import '../models/channel_model.dart';

part 'channel_api_service.g.dart';

@RestApi(baseUrl: ApiConst.endPoint)
abstract class ChannelApiService {
  factory ChannelApiService(Dio dio) => _ChannelApiService(dio);
  @GET(ApiConst.allChannels)
  Future<ChannelModel> getAllChannels();

  @GET(ApiConst.allChannels)
  Future<ChannelModel> getChannelsByPagination(@Query('page') int page);

  @GET(ApiConst.channelDetail)
  Future<ChannelDetail> getChannelDetail(@Path('channelId') int channelId);

  @GET(ApiConst.channelPost)
  Future<PostGetByChannelIdModel> getChannelPost(
    @Path('channelId') int channelId,
    @Query('page') int page,
  );

  @GET(ApiConst.aboutUs)
  Future<AboutUs> getAboutUs();

  @GET(ApiConst.allPosts)
  Future<AllPost> getAllPosts();

  @GET(ApiConst.allPosts)
  Future<AllPost> getPostByPagination(@Query('page') int page);

  @GET(ApiConst.search)
  Future<SearchModel> searchAll(
    @Query('searchText') String searchText,
  );

  @GET(ApiConst.feed)
  Future<FeedModel> getAllFeed(
    @Query('lastTimestamp') String lastTimestamp,
  );

  @GET(ApiConst.feed)
  Future<FeedModel> getFeedByPagination(
    @Query('page') int page,
    @Query('lastTimestamp') String lastTimestamp,
  );

  @PUT(ApiConst.likePost)
  Future likePost(@Path('postId') int postId);

  @PUT(ApiConst.cancelLikePost)
  Future cancelLikePost(@Path('postId') int postId);

  @PUT(ApiConst.unlikePost)
  Future unlikePost(@Path('postId') int postId);

  @PUT(ApiConst.cancelUnlikePost)
  Future cancelUnlikePost(@Path('postId') int postId);

  @PUT(ApiConst.viewPost)
  Future viewPost(@Path('postId') int postId);
}
