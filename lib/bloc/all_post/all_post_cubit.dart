import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayat/models/all_post.dart';
import 'package:zayat/services/channel_api_service.dart';

part 'all_post_state.dart';

class AllPostCubit extends Cubit<AllPostState> {
  AllPostCubit() : super(AllPostInitial());
  final ChannelApiService _channelApiService = ChannelApiService(Dio());
  List<Posts> posts = [];
  int page = 1;

  Future<void> getPosts({required bool isRefresh}) async {
    if (isRefresh) {
      emit(AllPostLoading());
      page = 1;
      posts.clear();
    }
    try {
      AllPost allPosts = await _channelApiService.getPostByPagination(page);
      posts = [...posts, ...allPosts.posts!];
      emit(AllPostSuccess(posts));
      page++;
    } catch (e) {
      emit(AllPostFailed('$e'));
    }
  }
}
