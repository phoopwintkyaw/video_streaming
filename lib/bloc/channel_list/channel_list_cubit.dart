import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayat/services/channel_api_service.dart';
import 'package:dio/dio.dart';

import '../../models/channel_model.dart';

part 'channel_list_state.dart';

class ChannelListCubit extends Cubit<ChannelListState> {
  ChannelListCubit() : super(ChannelListLoading());
  List<Channel> channels = [];
  int page = 1;

  final ChannelApiService _channelApiService = ChannelApiService(Dio());

  void getChannels({bool isRefresh = false}) async {
    if (isRefresh) {
      emit(ChannelListLoading());
      page = 1;
      channels.clear();
    }

    try {
      final ch = await _channelApiService.getChannelsByPagination(page);
      channels = [...channels, ...ch.content!];
      emit(ChannelListSuccess(channels));
      page++;
    } catch (e) {
      emit(ChannelListFailed('$e'));
    }
  }
}
