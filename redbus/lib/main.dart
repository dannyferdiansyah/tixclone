import 'package:TIXCLONE/page/pembayaran.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TIXCLONE/models/favorite_page_model.dart';
import 'package:TIXCLONE/models/namabus.dart';
import 'package:TIXCLONE/firebase_options.dart';
import 'package:TIXCLONE/page/bioskop.dart';
import 'package:TIXCLONE/page/bioskopList.dart';
import 'package:TIXCLONE/page/film.dart';
import 'package:TIXCLONE/page/homePage.dart';
import 'package:TIXCLONE/page/akunSaya.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:TIXCLONE/page/tiketList.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future<void> _firebaseMessagingOnTerminated() async {
  final fcm = FirebaseMessaging.instance;
  final message = await fcm.getInitialMessage();
  if (message != null) {
    final data = message.data;
    debugPrint("Terminated $data");
  }
}

AndroidNotificationChannel? channel;

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await _firebaseMessagingOnTerminated();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Aplikasi Redbus',
    //     theme: ThemeData(
    //       primarySwatch: Colors.red,
    //     ),
    //     home: MyBottomNavigationBar());
    return MultiProvider(
      providers: [
        Provider(create: (context) => namaBus()),
        ChangeNotifierProxyProvider<namaBus, FavoritePageModel>(create: (context) => FavoritePageModel(),
        update: (context, busStage, tiket) {
          if (tiket == null) {
            throw ArgumentError.notNull('tiket');
          }
          tiket.namaBusList = busStage;
          return tiket;
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        home: MyBottomNavigationBar(),
        initialRoute: '/',
        routes: {
          '/tiketList' : (context) => tiketList(),
          '/bioskopList' :(context) => bioskopList(),
          '/filmList' :(context) => film(),
          '/pembayaran' :(context) => pembayaran()
        },
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  int _currentIndex = 0;
  final List<Widget> _children = [
    mainPage(),
    bioskop(),
    akunSaya(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message);
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin!.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel!.id,
              channel!.name,
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyBottomNavigationBar()),
      );
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Bioskop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun Saya',
            ),
          ]),
    );
  }
}
