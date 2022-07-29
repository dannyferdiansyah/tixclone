import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:TIXCLONE/main.dart';
import 'package:TIXCLONE/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:TIXCLONE/services/dio_service.dart';

import '../models/response_tiket_model.dart';

class formUpdateTiket extends StatefulWidget {
  const formUpdateTiket({Key? key}) : super(key: key);

  @override
  State<formUpdateTiket> createState() => _formUpdateTiketState();
}

class _formUpdateTiketState extends State<formUpdateTiket> {
  // final idTiketController = TextEditingController();
  final imageController = TextEditingController();
  final namaController = TextEditingController();
  final durasiController = TextEditingController();
  final hargaController = TextEditingController();
  final kursiController = TextEditingController();
  apiService service = apiService();
  PesananTiket? result = null;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List<String>;
    // if (args[0].isNotEmpty) {
    //   idTiketController.text = args[0];
    // }
    if (args[1].isNotEmpty) {
      imageController.text = args[1];
    }
    if (args[2].isNotEmpty) {
      namaController.text = args[2];
    }
    if (args[3].isNotEmpty) {
      durasiController.text = args[3];
    }
    if (args[4].isNotEmpty) {
      hargaController.text = args[4];
    }
    if (args[5].isNotEmpty) {
      kursiController.text = args[5];
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Update Tiket'),
        backgroundColor: Color.fromRGBO(213, 79, 88, 1),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Column(
            children: [
              TextField(
                controller: imageController,
                decoration: InputDecoration(hintText: 'Image URL'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: namaController,
                decoration: InputDecoration(hintText: 'Masukkan Jam'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: durasiController,
                decoration: InputDecoration(hintText: 'Harga'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: hargaController,
                decoration: InputDecoration(hintText: 'Estimasi'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: kursiController,
                decoration: InputDecoration(hintText: 'Nama Bis'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    dioService().update(
                      args[0],
                        imageController.text,
                        namaController.text,
                        durasiController.text,
                        hargaController.text,
                        kursiController.text,);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Tiket berhasil di update'),
                    ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyBottomNavigationBar()),
                    );
                  },
                  child: Text('Update Tiket'))
            ],
          ),
        ],
      ),
    );
  }
}
