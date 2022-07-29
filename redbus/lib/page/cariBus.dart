import 'dart:convert';

import 'package:TIXCLONE/models/namabus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:TIXCLONE/models/favorite_page_model.dart';
import 'package:TIXCLONE/models/namabus.dart';
import 'package:TIXCLONE/models/response_tix_model.dart';
import 'package:TIXCLONE/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:TIXCLONE/models/response_tiket_model.dart';
import 'package:http/http.dart' as http;

class busStage extends StatefulWidget {
  const busStage({Key? key}) : super(key: key);

  @override
  State<busStage> createState() => _busStageState();
}

class _busStageState extends State<busStage> {
  final namaBusC = Get.put(namaBus());

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

  late Future data;
  List<Apitix> data2 = [];
  
  void initState() {
    data = apiService().getData();
    data.then((value) {
      setState(() {
        data2 = value;
      });
    });
    super.initState();
  }

  // Future<List> getData() async {
  //   final response = await http
  //       .get(Uri.parse("http://192.168.0.188/pesanantiket/getdata.php"));
  //   return json.decode(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tujuan Anda'),
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
            : Color.fromRGBO(213, 79, 88, 1),
      ),
      backgroundColor: Colors.white,
      body: data2.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data2.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding:
                        const EdgeInsets.fromLTRB(4,1,4,0),
                    child: LimitedBox(
                        maxHeight: 110,
                        child: Row(
                          children: [
                            AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(data2[index].image)),
                            const SizedBox(width: 15),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    data2[index].nama,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)
                                ),
                                Text(
                                  data2[index].durasi,
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                                Text(
                                    data2[index].harga,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12)
                                ),
                                Text(
                                  data2[index].kursi,
                                  style: TextStyle(color: Colors.grey, fontSize: 12),
                                ),
                                SizedBox(
                                  height: 3
                                ),
                              ],
                            ))
                          ],
                        )));
                // return ListTile(
                //   title: Image.network(data2[index].image),
                // );
              },
            ),
      bottomNavigationBar: getNavbar(),
    );
  }

  Widget getNavbar() {
    int currentIndex = 0;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      iconSize: 30,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Operator Bus',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sunny_snowing),
          label: '06.00 - 11.59',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sunny),
          label: '12.00 - 17.59',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mode_night_outlined),
          label: '18.00 - 05.59',
        ),
      ],
    );
  }
}
