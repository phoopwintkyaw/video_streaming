part of 'about_us_cubit.dart';

@immutable
sealed class AboutUsState {}

final class AboutUsLoading extends AboutUsState {}

final class AboutUsSuccess extends AboutUsState {
  final AboutUs aboutUs;
  AboutUsSuccess(this.aboutUs);
}

final class AboutUsFailed extends AboutUsState {
  final String err;
  AboutUsFailed(this.err);
}
