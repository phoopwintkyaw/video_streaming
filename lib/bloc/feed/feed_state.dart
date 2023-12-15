part of 'feed_cubit.dart';

@immutable
sealed class FeedState {}

// final class FeedInitial extends FeedState {}

final class FeedLoading extends FeedState {}

final class FeedSuccess extends FeedState {
  final List<Posts> feed;
  FeedSuccess(this.feed);
}

final class FeedFailed extends FeedState {
  final String err;
  FeedFailed(this.err);
}
