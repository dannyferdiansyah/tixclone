import 'dart:convert';
import 'dart:developer';

import 'package:TIXCLONE/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:TIXCLONE/main.dart';
import 'package:TIXCLONE/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:TIXCLONE/services/dio_service.dart';

import '../models/response_tiket_model.dart';

class formAddTiket extends StatefulWidget {
  const formAddTiket({Key? key}) : super(key: key);

  @override
  State<formAddTiket> createState() => _formAddTiketState();
}

class _formAddTiketState extends State<formAddTiket> {
  final imageController = TextEditingController();
  final namaController = TextEditingController();
  final durasiController = TextEditingController();
  final hargaController = TextEditingController();
  final kursiController = TextEditingController();
  apiService service = apiService();
  PesananTiket? result = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Tambah Tiket'),
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
                decoration: InputDecoration(hintText: 'Masukkan Nama'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: durasiController,
                decoration: InputDecoration(hintText: 'Durasi'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: hargaController,
                decoration: InputDecoration(hintText: 'Harga'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: kursiController,
                decoration: InputDecoration(hintText: 'Kursi'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    dioService()
                        .post(
                            imageController.text,
                            namaController.text,
                            durasiController.text,
                            hargaController.text,
                            kursiController.text,)
                        .then((value) {
                      result = value;
                      setState(() {});
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Tiket berhasil di tambahkan'),
                    ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyBottomNavigationBar()),
                    );
                  },
                  child: Text('Add Tiket'))
            ],
          ),
        ],
      ),
    );
  }
}
