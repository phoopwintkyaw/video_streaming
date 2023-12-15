import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:zayat/bloc/about_us/about_us_cubit.dart';
import 'package:zayat/bloc/all_post/all_post_cubit.dart';
import 'package:zayat/bloc/channel_detail/channel_detail_cubit.dart';
import 'package:zayat/bloc/channel_list/channel_list_cubit.dart';
import 'package:zayat/bloc/channel_post/channel_post_cubit.dart';
import 'package:zayat/bloc/feed/feed_cubit.dart';
import 'package:zayat/bloc/search/search_cubit.dart';
import 'package:zayat/firebase_options.dart';
import 'package:zayat/screens/bottom_bar.dart';
import 'package:zayat/screens/channel_detail.dart';
import 'package:zayat/screens/info.dart';
import 'package:zayat/screens/post_detail.dart';
import 'package:zayat/screens/search.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialized Admob
  MobileAds.instance.initialize();

  //Initialized Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //FCM setup
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  // setupLocalNotifications();
  setupFirebaseMessaging();

  final fcmToken = await FirebaseMessaging.instance.getToken();
  log("FCMToken $fcmToken");

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChannelListCubit()),
        BlocProvider(create: (context) => AboutUsCubit()),
        BlocProvider(create: (context) => AllPostCubit()),
        BlocProvider(create: (context) => ChannelDetailCubit()),
        BlocProvider(create: (context) => ChannelPostCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => FeedCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint(
      "Handling a background message: ${message.messageId} ${message.notification?.title} ${message.notification?.body}");
  // _showLocalNotification(message);
}

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> _showLocalNotification(RemoteMessage message) async {
//   AndroidNotificationDetails androidPlatformChannelSpecifics =
//       const AndroidNotificationDetails(
//     'com.zayat.mobile', // Change this to your channel ID
//     'Zayat', '',
//     importance: Importance.max,
//     priority: Priority.high,
//     playSound: true,
//     // showWhen: false,
//   );

//   NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);

//   await flutterLocalNotificationsPlugin.show(
//     0,
//     message.notification?.title,
//     message.notification?.body,
//     platformChannelSpecifics,
//   );
// }

void setupFirebaseMessaging() {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint(
        "Handling a foreground message: ${message.messageId} ${message.notification?.title} ${message.notification?.body}");
    // Handle the incoming message
    // _showLocalNotification(message);
  });
}

// void setupLocalNotifications() {
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   const InitializationSettings initializationSettings =
//       InitializationSettings(android: initializationSettingsAndroid);

//   flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zayat',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0958d9),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      home: const BottomBar(),
      routes: {
        Search.route: (_) => const Search(),
        Info.route: (_) => const Info(),
        ChannelDetail.route: (_) => const ChannelDetail(),
        PostDetail.route: (_) => const PostDetail(),
      },
    );
  }
}
