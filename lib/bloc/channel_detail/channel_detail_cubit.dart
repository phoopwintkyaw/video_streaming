import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayat/services/channel_api_service.dart';

import '../../models/channel_detail.dart';

part 'channel_detail_state.dart';

class ChannelDetailCubit extends Cubit<ChannelDetailState> {
  ChannelDetailCubit() : super(ChannelDetailLoading());
  final ChannelApiService _channelApiService = ChannelApiService(Dio());
  void getChannelDetail(int channelId) async {
    emit(ChannelDetailLoading());
    try {
      final channelDetail =
          await _channelApiService.getChannelDetail(channelId);
      emit(ChannelDetailSuccess(channelDetail));
    } catch (e) {
      emit(ChannelDetailFailed('$e'));
    }
  }
}
