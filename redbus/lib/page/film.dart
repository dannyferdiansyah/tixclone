import 'package:TIXCLONE/models/response_tix_model.dart';
import 'package:TIXCLONE/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:TIXCLONE/models/response_tix_model.dart';
import 'package:TIXCLONE/page/tiketList.dart';
import 'package:TIXCLONE/services/api_service.dart';
import 'package:TIXCLONE/main.dart';
import 'package:get/get.dart';

String namaBioskop = "";

class film extends StatefulWidget {
  const film({Key? key}) : super(key: key);

  @override
  State<film> createState() => _filmState();
}

class _filmState extends State<film> {
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

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List<String>;
    if (args[0].isNotEmpty) {
      namaBioskop = args[0];
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('$namaBioskop'),
        ),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: LimitedBox(
                            maxHeight: 120,
                            child: Row(
                              children: [
                                AspectRatio(
                                    aspectRatio: 1.3,
                                    child: Image.network(data2[index].image)),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data2[index].nama,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Durasi : ' + data2[index].durasi,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'Harga : ' + data2[index].harga,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'Kursi : ' + data2[index].kursi,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                )),
                                IconButton(onPressed: (){
                                  Navigator.of(context).popAndPushNamed(
                                  '/tiketList',
                                  arguments: [
                                    data2[index].id,
                                    data2[index].nama,
                                    data2[index].image,
                                    data2[index].durasi,
                                    data2[index].harga,
                                    '$namaBioskop'
                                  ]);
                                }, icon: Icon(Icons.add_box_rounded))
                              ],
                            ),
                          ),
                        ),
                        // RaisedButton(
                        //     color: Colors.blue[900],
                        //     onPressed: () {
                        //       // Get.to(tiket())
                        //       Navigator.of(context).popAndPushNamed(
                        //           '/tiketList',
                        //           arguments: [
                        //             data2[index].id,
                        //             data2[index].nama,
                        //             data2[index].image,
                        //             data2[index].durasi,
                        //             data2[index].harga,
                        //             data2[index].kursi,
                        //           ]);
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(builder: (context) => tiketList()),
                        //       );
                        //     },
                        //     child: Text(
                        //       'Booking Tiket',
                        //       style: TextStyle(color: Colors.white),
                        //     ))
                      ],
                    ),
                  );
                }));
  }
}
