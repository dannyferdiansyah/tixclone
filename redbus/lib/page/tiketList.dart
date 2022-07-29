import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:TIXCLONE/main.dart';
import 'package:TIXCLONE/main.dart';
import 'package:TIXCLONE/models/response_tix_model.dart';

import '../services/api_service.dart';

String finalNama = "";
String idFilm = "";
String namaFilm = "";
String gambar = "";
String durasiFilm = "";
String hargaFilm = "";
String namaBios = "";

class tiketList extends StatefulWidget {
  const tiketList({
    Key? key,
  }) : super(key: key);

  @override
  State<tiketList> createState() => _tiketListState();
}

class _tiketListState extends State<tiketList> {
  final namaController = TextEditingController();
  apiService service = apiService();
  Apitix? result = null;
  // List<Apitix>
  void initState() {
    getValidationData().whenComplete(() async =>
        Get.to(finalNama == "" ? tiketList() : MyBottomNavigationBar()));
    super.initState();
  }

  Future getValidationData() async {
    final user = FirebaseAuth.instance.currentUser!;
    setState(() {
      finalNama = user.email!;
    });
    print(finalNama);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List<String>;
    if (args[0].isNotEmpty) {
      idFilm = args[0];
    }
    if (args[1].isNotEmpty) {
      namaFilm = args[1];
    }
    if (args[2].isNotEmpty) {
      gambar = args[2];
    }
    if (args[3].isNotEmpty) {
      durasiFilm = args[3];
    }
    if (args[4].isNotEmpty) {
      hargaFilm = args[4];
    }
    if (args[5].isNotEmpty) {
      namaBios = args[5];
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 212, 212, 212),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.network(
            'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/fqd7bfjhay48dq0q0xjg',
            height: 250,
            width: 75),
      ),
      backgroundColor: Color.fromARGB(255, 145, 145, 145),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text('$finalNama',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: 400,
              height: 500,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Text("BUKTI BOOKING",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 20,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.blueAccent,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'ID Pembayaran : \n$idFilm',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '$namaFilm',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  Image.network(
                    '$gambar',
                    width: 300,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'Durasi Film : \n$durasiFilm',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'Bioskop : \n$namaBios',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Divider(
                    height: 20,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.blueAccent,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'Total : ',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Text(
                        '$hargaFilm',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[900]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          RaisedButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(
                                  '/pembayaran',
                                  arguments: [
                                    '$idFilm',
                                    '$namaBios',
                                    '$namaFilm',
                                    '$hargaFilm',
                                  ]);
              },
              color: Colors.blue[900],
              child: Text(
                'Bayar',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
