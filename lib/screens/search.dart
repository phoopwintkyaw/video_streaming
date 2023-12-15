import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayat/bloc/search/search_cubit.dart';
import 'package:zayat/widgets/channel_widget.dart';
import 'package:zayat/widgets/post_widget.dart';
import 'package:zayat/widgets/search_form_field.dart';

class Search extends StatefulWidget {
  const Search({super.key});
  static const String route = '/search';

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController search;
  @override
  void initState() {
    super.initState();
    search = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    search.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<SearchCubit>().clearSearchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8),
          child: SearchFormField(controller: search),
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) => switch (state) {
          SearchInitial() => const SizedBox(),
          SearchLoading() => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          SearchFailed() => Center(
              child: Text(state.err),
            ),
          SearchSuccess() => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.search.channelResponses!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Channels',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.search.channelResponses!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) => ChannelWidget(
                              channel: state.search.channelResponses![i],
                            ),
                            // ChannelWidget(channel: ,),
                            separatorBuilder: (context, i) => const Divider(
                              indent: 10,
                              endIndent: 10,
                            ),
                          ),
                        ],
                      ),
                    if (state.search.postResponses!.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Posts',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.search.postResponses!.length,
                            itemBuilder: (context, i) => PostWidget(
                              posts: state.search.postResponses![i],
                            ),
                            //Container(), //  PostWidget(posts: ,),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
        },
      ),
    );
  }
}
