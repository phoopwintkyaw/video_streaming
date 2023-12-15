import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zayat/bloc/channel_detail/channel_detail_cubit.dart';
import 'package:zayat/bloc/channel_post/channel_post_cubit.dart';
import 'package:zayat/widgets/post_widget.dart';

class ChannelDetail extends StatefulWidget {
  const ChannelDetail({super.key});
  static const String route = '/channelDetail';

  @override
  State<ChannelDetail> createState() => _ChannelDetailState();
}

class _ChannelDetailState extends State<ChannelDetail> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final channel =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    context.read<ChannelDetailCubit>().getChannelDetail(channel['channelId']);
    context
        .read<ChannelPostCubit>()
        .getChannelPost(channel['channelId'], isRefresh: true);
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    final channel =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    context.read<ChannelDetailCubit>().getChannelDetail(channel['channelId']);
    context
        .read<ChannelPostCubit>()
        .getChannelPost(channel['channelId'], isRefresh: true);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    final channel =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    context
        .read<ChannelPostCubit>()
        .getChannelPost(channel['channelId'], isRefresh: false);
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    final channel =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(channel['channelName'] ?? ''),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        controller: _refreshController,
        physics: const BouncingScrollPhysics(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<ChannelDetailCubit, ChannelDetailState>(
                builder: (context, state) {
                  if (state is ChannelDetailSuccess) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  state.channelDetail.coverPhoto ?? ''),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          state.channelDetail.channelName ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          state.channelDetail.description ?? '',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              BlocBuilder<ChannelPostCubit, ChannelPostState>(
                builder: (context, state) {
                  return switch (state) {
                    ChannelPostLoading() => const Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                    ChannelPostSuccess() => ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.posts.length,
                        itemBuilder: (context, i) =>
                            PostWidget(posts: state.posts[i]),
                      ),
                    ChannelPostFailed() => Center(
                        child: Center(
                          child: Text(state.err),
                        ),
                      ),
                  };
                },
              )
            ],
          ),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (context, i) => const PostWidget(),
      // ),
    );
  }
}
