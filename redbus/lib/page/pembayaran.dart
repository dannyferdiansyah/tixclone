import 'package:TIXCLONE/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime dateTime = DateTime.now();
String tanggalFormat = DateFormat("dd MMMM yyyy").format(dateTime);
String jamFormat = DateFormat("HH:mm:ss").format(dateTime);
String idPembayaran = "";
String nBios = "";
String nFilm = "";
String hFilm = "";

class pembayaran extends StatefulWidget {
  const pembayaran({Key? key}) : super(key: key);

  @override
  State<pembayaran> createState() => _pembayaranState();
}

class _pembayaranState extends State<pembayaran> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List<String>;
    if (args[0].isNotEmpty) {
      idPembayaran = args[0];
    }
    if (args[1].isNotEmpty) {
      nBios = args[1];
    }
    if (args[2].isNotEmpty) {
      nFilm = args[2];
    }
    if (args[3].isNotEmpty) {
      hFilm = args[3];
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 212, 212, 212),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyBottomNavigationBar()),
                );
              },
              icon: Icon(Icons.home))
        ],
        title: Image.network(
            'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/fqd7bfjhay48dq0q0xjg',
            height: 250,
            width: 75),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Image.asset(
            'images/check-mark-verified.gif',
            height: 75,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Berhasil',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '$tanggalFormat, $jamFormat',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: 400,
              height: 50,
              color: Color.fromARGB(255, 192, 189, 189),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'ID Pembayaran :',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 7,
                            ),
                            Text('$idPembayaran',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: 400,
              height: 300,
              color: Color.fromARGB(255, 236, 234, 234),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Nama Bioskop',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 7,
                            ),
                            Text('$nBios',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700)),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Nama Film',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 7,
                            ),
                            Text('$nFilm',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700)),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Harga Film',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 7,
                            ),
                            Text('Detail',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700)),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Detail Pembayaran',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 21, 104, 230)),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 7,
                            ),
                            Text('Total',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              width: 215,
                            ),
                            Text(
                              '$hFilm',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 21, 104, 230)),
                            ),
                          ],
                        ),
                      ],
                    )
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
