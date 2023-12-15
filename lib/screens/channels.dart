import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zayat/bloc/channel_list/channel_list_cubit.dart';
import 'package:zayat/widgets/banner_ads.dart';
import 'package:zayat/widgets/channel_widget.dart';

class Channels extends StatefulWidget {
  const Channels({super.key});

  @override
  State<Channels> createState() => _ChannelsState();
}

class _ChannelsState extends State<Channels> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ChannelListCubit>().getChannels(isRefresh: true);
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // context.read<ChannelListCubit>().getAllChannels();
    context.read<ChannelListCubit>().getChannels(isRefresh: true);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // context.read<ChannelListCubit>().getChannelsByPagination();
    context.read<ChannelListCubit>().getChannels(isRefresh: false);
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelListCubit, ChannelListState>(
      builder: (context, state) {
        return switch (state) {
          ChannelListLoading() =>
            const Center(child: CircularProgressIndicator.adaptive()),
          ChannelListSuccess() => SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              controller: _refreshController,
              physics: const BouncingScrollPhysics(),
              child: ListView.separated(
                itemCount: state.channel.length,
                itemBuilder: (context, i) =>
                    ChannelWidget(channel: state.channel[i]),
                separatorBuilder: (context, i) => Column(
                  children: [
                    const Divider(
                      indent: 10,
                      endIndent: 10,
                    ),
                    if (i % 5 == 0) const BannerAds(),
                  ],
                ),
              ),
            ),
          ChannelListFailed() => Center(child: Text(state.err)),
        };
      },
    );
  }
}
