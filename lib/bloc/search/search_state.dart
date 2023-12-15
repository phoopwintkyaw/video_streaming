part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final SearchModel search;
  SearchSuccess(this.search);
}

final class SearchFailed extends SearchState {
  final String err;
  SearchFailed(this.err);
}
