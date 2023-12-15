import 'package:flutter/material.dart';
import 'package:zayat/screens/channels.dart';
import 'package:zayat/screens/feeds.dart';
import 'package:zayat/screens/home.dart';
import 'package:zayat/screens/info.dart';
import 'package:zayat/screens/search.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 1;
  List<Widget> pages = [
    const Feeds(),
    const Home(),
    const Channels(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.asset('assets/images/zayat.png'),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(Search.route),
            icon: const Icon(
              Icons.search,
              color: Color(0xfff1ae56),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(Info.route),
            icon: const Icon(
              Icons.info,
              color: Color(0xfff1ae56),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xff0958d9),
        indicatorColor: const Color(0xfff1ae56),
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.feed,
              color: Colors.white,
            ),
            label: 'Feeds',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.wifi_channel,
              color: Colors.white,
            ),
            label: 'Channels',
          ),
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (int val) => setState(() {
          currentIndex = val;
        }),
      ),
    );
  }
}
