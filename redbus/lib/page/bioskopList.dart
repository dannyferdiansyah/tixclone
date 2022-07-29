import 'package:flutter/material.dart';
import 'package:TIXCLONE/page/film.dart';
import 'package:TIXCLONE/page/lokasi.dart';

String namaB = "";
String namaBioskop1 = "";
String namaBioskop2 = "";
String namaBioskop3 = "";

class bioskopList extends StatefulWidget {
  const bioskopList({Key? key}) : super(key: key);

  @override
  State<bioskopList> createState() => _bioskopListState();
}

class _bioskopListState extends State<bioskopList> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List<String>;
    // if (args[0].isNotEmpty) {
    //   namaB = args[0];
    // }
    if (args[1].isNotEmpty) {
      namaB = args[1];
    }
    if (args[2].isNotEmpty) {
      namaBioskop1 = args[2];
    }
    if (args[3].isNotEmpty) {
      namaBioskop2 = args[3];
    }
    if (args[4].isNotEmpty) {
      namaBioskop3 = args[4];
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
      body: ListView(children: [
        Row(
          children: [
            TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => lokasi()),
                  );
                },
                icon: Icon(
                  Icons.pin_drop,
                  color: Colors.black,
                ),
                label: Text(
                  '$namaB',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )),
          ],
        ),
        Container(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            width: 400,
            height: 50,
            color: Colors.white,
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    label: Text("$namaBioskop1",
                        style: TextStyle(color: Colors.grey[700])),
                    icon: Icon(Icons.stars),
                    onPressed: () {
                      Navigator.of(context)
                          .popAndPushNamed('/filmList', arguments: [
                        '$namaBioskop1',
                      ]);
                    },
                  ),
                ],
              ),
            ]),
          ),
        ),
        Container(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            width: 400,
            height: 50,
            color: Colors.white,
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    label: Text("$namaBioskop2",
                        style: TextStyle(color: Colors.grey[700])),
                    icon: Icon(Icons.stars),
                    onPressed: () {
                      Navigator.of(context)
                          .popAndPushNamed('/filmList', arguments: [
                        '$namaBioskop2',
                      ]);
                    },
                  ),
                ],
              ),
            ]),
          ),
        ),
        Container(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            width: 400,
            height: 50,
            color: Colors.white,
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    label: Text("$namaBioskop3",
                        style: TextStyle(color: Colors.grey[700])),
                    icon: Icon(Icons.stars),
                    onPressed: () {
                      Navigator.of(context)
                          .popAndPushNamed('/filmList', arguments: [
                        '$namaBioskop3',
                      ]);
                    },
                  ),
                ],
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
