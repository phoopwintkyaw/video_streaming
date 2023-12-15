part of 'channel_detail_cubit.dart';

@immutable
sealed class ChannelDetailState {}

final class ChannelDetailLoading extends ChannelDetailState {}

final class ChannelDetailSuccess extends ChannelDetailState {
  final ChannelDetail channelDetail;
  ChannelDetailSuccess(this.channelDetail);
}

final class ChannelDetailFailed extends ChannelDetailState {
  final String err;
  ChannelDetailFailed(this.err);
}
