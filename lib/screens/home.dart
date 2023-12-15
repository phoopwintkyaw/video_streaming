import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zayat/bloc/all_post/all_post_cubit.dart';
import 'package:zayat/widgets/banner_ads.dart';
import 'package:zayat/widgets/post_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const String route = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    context.read<AllPostCubit>().getPosts(isRefresh: true);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    context.read<AllPostCubit>().getPosts(isRefresh: false);
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AllPostCubit, AllPostState>(builder: (context, state) {
        if (state is AllPostInitial) {
          context.read<AllPostCubit>().getPosts(isRefresh: true);
        }
        if (state is AllPostLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is AllPostSuccess) {
          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            controller: _refreshController,
            physics: const BouncingScrollPhysics(),
            child: ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    PostWidget(
                      posts: state.posts[i],
                    ),
                    if (i % 5 == 0) const BannerAds(),
                  ],
                );
              },
            ),
          );
        }
        if (state is AllPostFailed) {
          return Center(
            child: Text(state.err),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }),
    );
  }
}

        // switch (state) {
        //   AllPostInitial()=> context.read<AllPostCubit>().getAllPost(),
        //   AllPostLoading() => const Center(
        //       child: CircularProgressIndicator.adaptive(),
        //     ),
        //   AllPostSuccess() => ListView.builder(
        //       itemCount: state.allPosts.posts?.length ?? 0,
        //       itemBuilder: (context, i) => PostWidget(
        //         posts: state.allPosts.posts![i],
        //       ),
        //     ),
        //   AllPostFailed() => Center(
        //       child: Text(state.err),
        //     ),
        // },