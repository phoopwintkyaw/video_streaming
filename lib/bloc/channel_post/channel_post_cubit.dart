import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayat/models/all_post.dart';
import 'package:zayat/services/channel_api_service.dart';

part 'channel_post_state.dart';

class ChannelPostCubit extends Cubit<ChannelPostState> {
  ChannelPostCubit() : super(ChannelPostLoading());
  final ChannelApiService _channelApiService = ChannelApiService(Dio());
  int page = 1;
  List<Posts> posts = [];

  void getChannelPost(int channelId, {required bool isRefresh}) async {
    if (isRefresh) {
      emit(ChannelPostLoading());
      page = 1;
      posts.clear();
    }
    try {
      log('Log page $page');
      final p = await _channelApiService.getChannelPost(channelId, page);
      posts = [...posts, ...p.post!];
      emit(ChannelPostSuccess(posts));
      page++;
    } catch (e) {
      emit(ChannelPostFailed('$e'));
    }
  }
}
