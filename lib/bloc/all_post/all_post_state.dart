part of 'all_post_cubit.dart';

@immutable
sealed class AllPostState {}

final class AllPostInitial extends AllPostState {}

final class AllPostLoading extends AllPostState {}

final class AllPostSuccess extends AllPostState {
  final List<Posts> posts;
  AllPostSuccess(this.posts);
}

final class AllPostFailed extends AllPostState {
  final String err;
  AllPostFailed(this.err);
}
