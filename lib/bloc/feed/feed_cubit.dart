import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayat/models/all_post.dart';
import 'package:zayat/services/channel_api_service.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(FeedLoading());
  final ChannelApiService _channelApiService = ChannelApiService(Dio());
  int page = 1;
  List<Posts> posts = [];
  void getAllFeed(String timestamp, {required bool isRefresh}) async {
    if (isRefresh) {
      page = 1;
      posts.clear();
      emit(FeedLoading());
    }
    try {
      final feeds = await _channelApiService.getAllFeed(timestamp);
      posts = [...posts, ...feeds.content!];
      emit(FeedSuccess(posts));
      page++;
    } catch (e) {
      emit(FeedFailed('$e'));
    }
  }
}
