part of 'channel_list_cubit.dart';

@immutable
sealed class ChannelListState {}

final class ChannelListLoading extends ChannelListState {}

final class ChannelListSuccess extends ChannelListState {
  final List<Channel> channel;
  ChannelListSuccess(this.channel);
}

final class ChannelListFailed extends ChannelListState {
  final String err;
  ChannelListFailed(this.err);
}
