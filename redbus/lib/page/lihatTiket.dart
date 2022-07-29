import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:TIXCLONE/form/formUpdateTiket.dart';
import 'package:TIXCLONE/main.dart';
import 'package:TIXCLONE/models/favorite_page_model.dart';
import 'package:TIXCLONE/models/namabus.dart';
import 'package:TIXCLONE/models/response_tix_model.dart';
import 'package:TIXCLONE/services/api_service.dart';
import 'package:TIXCLONE/services/dio_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:TIXCLONE/models/response_tiket_model.dart';
import 'package:http/http.dart' as http;

class lihatTiket extends StatefulWidget {
  const lihatTiket({Key? key}) : super(key: key);

  @override
  State<lihatTiket> createState() => _lihatTiketState();
}

class _lihatTiketState extends State<lihatTiket> {
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
                  padding: const EdgeInsets.fromLTRB(4, 2, 2, 20),
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
                                      color: Colors.black, fontSize: 16)),
                              Text(
                                data2[index].durasi,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Text(
                                  data2[index].harga,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12)),
                              Text(
                                data2[index].kursi,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              SizedBox(height: 3),
                            ],
                          )),
                          Column(children: [
                            SizedBox(height: 14),
                            IconButton(
                                onPressed: () {
                                  dioService().delete(data2[index].id);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('Tiket berhasil di hapus'),
                                  ));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyBottomNavigationBar()),
                                  );
                                },
                                icon: Icon(Icons.delete_outline_outlined)),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).popAndPushNamed('/formUpdateTiket',
                                  arguments: [
                                    data2[index].id,
                                    data2[index].image,
                                    data2[index].nama,
                                    data2[index].durasi,
                                    data2[index].harga,
                                    data2[index].kursi,
                                  ]);
                                },
                                icon: Icon(Icons.recycling_outlined))
                          ]),
                        ],
                      )),
                );
                // return ListTile(
                //   title: Image.network(data2[index].image),
                // );
              },
            ),
    );
  }
}
