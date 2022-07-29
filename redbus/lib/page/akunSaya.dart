import 'package:TIXCLONE/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:TIXCLONE/form/formAddTiket.dart';
import 'package:TIXCLONE/form/formLogin.dart';
import 'package:get/get.dart';
import 'package:TIXCLONE/page/film.dart';
import 'package:TIXCLONE/page/lihatTiket.dart';
import 'package:TIXCLONE/page/tiketList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:TIXCLONE/form/formDaftar.dart';

String finalNama = "";

class akunSaya extends StatefulWidget {
  const akunSaya({Key? key}) : super(key: key);
  @override
  State<akunSaya> createState() => _akunSayaState();
}

class _akunSayaState extends State<akunSaya> {
  void initState() {
    getValidationData().whenComplete(() async =>
        Get.to(finalNama == "" ? akunSaya() : MyBottomNavigationBar()));
    super.initState();
  }

  Future getValidationData() async {
    final user = FirebaseAuth.instance.currentUser!;
    setState(() {
      finalNama = user.email!;
    });
    print(finalNama);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Akun Saya'),
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
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
      backgroundColor:
          isDark ? Color.fromARGB(255, 161, 161, 161) : Colors.white,
      body: ListView(
        children: <Widget>[
          Text('  Hello, $finalNama',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w700)),
          Container(
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: 400,
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => formLogin()),
                        );
                      },
                      child: Text("Login Akun"),
                      style: ElevatedButton.styleFrom(
                        primary: isDark
                            ? Color.fromARGB(255, 105, 105, 105)
                            : Color.fromARGB(255, 212, 212, 212),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => formDaftar()),
                        );
                      },
                      child: Text("Daftar Akun"),
                      style: ElevatedButton.styleFrom(
                        primary: isDark
                            ? Color.fromARGB(255, 105, 105, 105)
                            : Color.fromARGB(255, 212, 212, 212),
                      ),
                    ),
                  ]),
            ),
          ),
          // 1
          // Container(
          //   child: Container(
          //     margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          //     width: 400,
          //     height: 50,
          //     color: Colors.white,
          //     child:
          //         Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          //       SizedBox(
          //         width: 15,
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text("Tambah Tiket Baru",
          //               style: TextStyle(color: Colors.grey[700])),
          //         ],
          //       ),
          //       SizedBox(
          //         width: 144,
          //       ),
          //       IconButton(
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => formAddTiket()),
          //             );
          //           },
          //           icon: Icon(Icons.arrow_forward_ios_outlined))
          //     ]),
          //   ),
          // ),
          // 1
          // Container(
          //   child: Container(
          //     margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          //     width: 400,
          //     height: 50,
          //     color: Colors.white,
          //     child:
          //         Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          //       SizedBox(
          //         width: 15,
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text("Lihat Film",
          //               style: TextStyle(color: Colors.grey[700])),
          //         ],
          //       ),
          //       SizedBox(
          //         width: 200,
          //       ),
          //       IconButton(
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => film()),
          //             );
          //           },
          //           icon: Icon(Icons.arrow_forward_ios_outlined))
          //     ]),
          //   ),
          // ),
          // 2
          Container(
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
              width: 400,
              height: 50,
              color: Colors.white,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SizedBox(
                  width: 3,
                ),
                Column(
                  children: [
                    TextButton(
                        onPressed: () async {
                          try {
                            final FirebaseAuth _auth = FirebaseAuth.instance;
                            _auth.signOut();
                            finalNama = "";
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Logout Berhasil!'),
                            ));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyBottomNavigationBar()),
                            );
                          } on FirebaseAuthException catch (e) {
                            debugPrint(e.message ?? "Unknown Error");
                          }
                          //   SharedPreferences prefs = await SharedPreferences.getInstance();
                          //   prefs.remove('nama');
                          //   Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => formLogin()),
                          // );
                        },
                        child: Text(
                          "Keluar",
                          style: TextStyle(color: Colors.grey[700]),
                        ))
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
