part of 'channel_post_cubit.dart';

@immutable
sealed class ChannelPostState {}

final class ChannelPostLoading extends ChannelPostState {}

final class ChannelPostSuccess extends ChannelPostState {
  final List<Posts> posts;
  ChannelPostSuccess(this.posts);
}

final class ChannelPostFailed extends ChannelPostState {
  final String err;
  ChannelPostFailed(this.err);
}
