import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:TIXCLONE/page/bioskop.dart';
import 'package:TIXCLONE/page/cariBus.dart';
import 'package:intl/intl.dart';
import 'package:TIXCLONE/page/lokasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
// }

// AndroidNotificationChannel? channel;

// FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

class mainPage extends StatefulWidget {
  _mainPage createState() => _mainPage();
}

class _mainPage extends State<mainPage> {
  TextEditingController dateinput = TextEditingController();
  late FirebaseMessaging messaging;
  final List<String> imageList = [
    'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/film-7-76.jpg',
    'https://media.suara.com/pictures/653x366/2022/06/08/56923-5-rekomendasi-film-seru-indonesia-2022-yang-akan-tayang-dalam-waktu-dekat-imdbcom.jpg',
    'https://t-2.tstatic.net/kalteng/foto/bank/images/Film-horor-baru-Indonesia-Ivanna-tayang-di-bioskop.jpg',
    'https://s3.theasianparent.com/cdn-cgi/image/height=250/tap-assets-prod/wp-content/uploads/sites/24/2022/05/film-bioskop-mei-5.jpg',
    'https://cdn.linkaja.com/website/posts/April2022/1650875581-film-barat-terbaru.jpg'
  ];
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print(value);
    });

    // FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    //   print("message recieved");
    //   print(event.notification!.body);
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((message) {
    //   print('Message clicked!');
    // });
  }

  bool isDark = false;

  saveToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDark", isDark);
  }

  getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool("isDark") ?? false;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.network(
            'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/fqd7bfjhay48dq0q0xjg',
            height: 250,
            width: 75),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: InkWell(
              child: isDark
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
              onTap: () {
                isDark = !isDark;
                saveToLocalStorage();
                setState(() {});
              },
            ),
          )
        ],
        backgroundColor: isDark
            ? Color.fromARGB(255, 105, 105, 105)
            : Color.fromARGB(255, 212, 212, 212),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              const Icon(Icons.pin_drop_rounded),
              TextButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => lokasi()),
                    );
                  },
                  child: Text(
                    "Pilih Lokasi                                                       ",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(autoPlay: true),
            items: imageList
                .map((item) => Center(
                        child: Image.network(
                      item,
                      fit: BoxFit.cover,
                    )))
                .toList(),
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              const Text(
                'Sedang Tayang',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 92,
              ),
              TextButton.icon(
                  label: Text(
                    'Lihat Semua',
                    style: TextStyle(color: Color.fromARGB(255, 5, 60, 155)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => lokasi()),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward,
                      color: Color.fromARGB(255, 5, 60, 155)))
            ],
          ),
          SizedBox(height: 25),
          Center(
            child: Text(
              'Tanpa Ribet,',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
              child: Text('Beli Tiket dengan Klik Gambar Dibawah!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: imageList
                    .map((item) => Center(
                            child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => lokasi()),
                            );
                          },
                          icon: Image.network(item),
                          iconSize: 500,
                        )))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
