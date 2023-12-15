import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zayat/bloc/feed/feed_cubit.dart';
import 'package:zayat/widgets/banner_ads.dart';
import 'package:zayat/widgets/post_widget.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});
  static const String route = '/feeds';

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  final date = DateFormat("yyyy-MM-ddTHH:mm:ss'Z'").format(DateTime.now());
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<FeedCubit>().getAllFeed(date, isRefresh: true);
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    context.read<FeedCubit>().getAllFeed(date, isRefresh: true);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    context.read<FeedCubit>().getAllFeed(date, isRefresh: false);
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        controller: _refreshController,
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<FeedCubit, FeedState>(
          builder: (context, state) {
            if (state is FeedLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is FeedSuccess) {
              if (state.feed.isEmpty) {
                return const Center(
                  child: Text('No Feeds Found'),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.feed.length,
                itemBuilder: (context, i) => Column(
                  children: [
                    PostWidget(
                      posts: state.feed[i],
                    ),
                    if (i % 5 == 0) const BannerAds(),
                  ],
                ),
              );
            }
            if (state is FeedFailed) {
              return Center(child: Text(state.err));
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
