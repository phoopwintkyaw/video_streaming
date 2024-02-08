import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayat/models/about_us.dart';
import 'package:zayat/services/channel_api_service.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit() : super(AboutUsLoading());
  final ChannelApiService _channelApiService = ChannelApiService(Dio());

  void getAboutUs() async {
    emit(AboutUsLoading());
    try {
      AboutUs aboutUs = await _channelApiService.getAboutUs();
      emit(AboutUsSuccess(aboutUs));
    } catch (e) {
      emit(AboutUsFailed('$e'));
      debugPrint('Hello');
    }
  }
}
