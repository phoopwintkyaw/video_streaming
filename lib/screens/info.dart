import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayat/bloc/about_us/about_us_cubit.dart';

class Info extends StatefulWidget {
  const Info({super.key});
  static const String route = '/info';

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<AboutUsCubit>().getAboutUs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ကျွန်ုပ်တို့အကြောင်း'),
      ),
      body: BlocBuilder<AboutUsCubit, AboutUsState>(
        builder: (context, state) {
          return Center(
            child: switch (state) {
              AboutUsLoading() => const CircularProgressIndicator.adaptive(),
              AboutUsSuccess() => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.aboutUs.text!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const Text('2023 \u00a9 copyright by Zayat'),
                  ],
                ),
              AboutUsFailed() => Center(
                  child: Text(state.err),
                ),
            },
          );
          // return Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.all(8.0),
          //       child: Text(
          //         '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum''',
          //         style: TextStyle(
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //         textAlign: TextAlign.justify,
          //       ),
          //     ),
          //     Text('2023 \u00a9 copyright by Zayat'),
          //   ],
          // );
        },
      ),
    );
  }
}
