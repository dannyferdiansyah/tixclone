import 'package:flutter/material.dart';
import 'package:TIXCLONE/main.dart';
import 'package:TIXCLONE/models/response_lokasi_model.dart';
import 'package:TIXCLONE/page/homePage.dart';
import 'package:TIXCLONE/page/bioskop.dart';
import 'package:TIXCLONE/services/api_service.dart';

class lokasi extends StatefulWidget {
  const lokasi({Key? key}) : super(key: key);

  @override
  State<lokasi> createState() => _lokasiState();
}

class _lokasiState extends State<lokasi> {
  late Future data;
  List<Apilokasi> data2 = [];

  void initState() {
    data = apiService().getLokasi();
    data.then((value) {
      setState(() {
        data2 = value;
      });
    });
    super.initState();
  }

  var namaLokasi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'PILIH LOKASI',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
      body: data2.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data2.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(4, 2, 2, 20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        width: 400,
                        height: 50,
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton.icon(
                                    onPressed: () {
                                      Navigator.of(context).popAndPushNamed(
                                          '/bioskopList',
                                          arguments: [
                                            data2[index].id,
                                            data2[index].nama,
                                            data2[index].bioskop1,
                                            data2[index].bioskop2,
                                            data2[index].bioskop3,
                                          ]);
                                    },
                                    icon: Icon(Icons.stars),
                                    label: Text(
                                      data2[index].nama,
                                      style: TextStyle(color: Colors.grey[700]),
                                    ))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
