import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayat/models/search_model.dart';
import 'package:zayat/services/channel_api_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final ChannelApiService _channelApiService = ChannelApiService(Dio());

  void getSearchAll(String searchText) async {
    emit(SearchLoading());
    try {
      final search = await _channelApiService.searchAll(searchText);
      emit(SearchSuccess(search));
    } catch (e) {
      emit(SearchFailed('$e'));
    }
  }

  void clearSearchHistory() {
    emit(SearchInitial());
  }
}
