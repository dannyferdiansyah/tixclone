import 'package:TIXCLONE/page/lokasi.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class bioskop extends StatefulWidget {
  const bioskop({Key? key}) : super(key: key);

  @override
  State<bioskop> createState() => _bioskopState();
}

class _bioskopState extends State<bioskop> {
  final List<String> imageMalang = [
    'https://img.inews.co.id/media/822/files/inews_new/2022/01/08/bundaran_tugu_malang.jpg',
    'https://pbs.twimg.com/media/DbhG5UBVAAQMy25?format=jpg&name=4096x4096',
    'https://sikidang.com/wp-content/uploads/harga-tiket-masuk-dieng-plateau-theater.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Cinepolis_Istana_Plaza_Bandung_Entrance.jpg/800px-Cinepolis_Istana_Plaza_Bandung_Entrance.jpg'
  ];
  final List<String> imageMojokerto = [
    'https://travelspromo.com/wp-content/uploads/2021/12/Ornamen-dari-Batu-Bata-Khas-Kerajaan-Majapahit.-Foto-Gmap-Fahmi-Hakim-e1639364159743.jpg',
    'https://radarmojokerto.jawapos.com/wp-content/uploads/2020/12/promo-spesial-di-malam-pergantian-tahun_m_232144.jpg',
    'https://inilahmojokerto.com/wp-content/uploads/2020/10/CGV-Sunrise-Mall.jpg',
    'https://jadwalnonton.com/data/upload/theaters/cgv-sunrise-mall-mojokerto.jpg'
  ];
  final List<String> imageSidoarjo = [
    'https://upload.wikimedia.org/wikipedia/commons/1/15/Alun-alun-sidoarjo.jpg',
    'https://1.bp.blogspot.com/-Fg37wlXYock/XR7C9ovNVkI/AAAAAAAALB8/gHNOex7qwQQy072B46O-cK7ug6gsEnI0ACLcBGAs/s1600/ciplaz%2Bsidoarjo.jpg',
    'https://1.bp.blogspot.com/-jviTu42eZM4/XcjORpovrZI/AAAAAAAAMB4/xxnwWT_KgF8z-O3LKgeSF2hL3aFCyOTqwCLcBGAsYHQ/s1600/Cin%25C3%25A9polis%2BPertama.jpg'
  ];
  final List<String> imageSurabaya = [
    'https://img.alinea.id/img/content/2020/05/27/76635/enam-kelurahan-di-surabaya-bebas-kasus-positif-covid-19-BnlZdQYpK6.jpg',
    'https://jadwalnonton.com/data/upload/movies/2017/cito-xxi-surabaya.jpg',
    'https://lh3.googleusercontent.com/p/AF1QipNE6NVrC_swHUVV0tE71rRenengaotjv1DawcwL=s1600-w400',
    'https://www.pakuwonjati.com/upload/2020/05/5eb03197ea32d-pkw-mall-com-10gc-gallery0.jpg'
  ];
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 15,),
              Text('Ingin mencari bioskop terbaik?', style: TextStyle(fontSize: 20),),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 15,),
              Text('Hanya di TIX ID!', style: TextStyle(fontSize: 20)),
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
                      label: Text("MALANG",
                          style: TextStyle(color: Colors.grey[700])),
                      icon: Icon(Icons.stars),
                      onPressed: () {},
                    ),
                  ],
                ),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,0),
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: imageMalang
                    .map((item) => Center(
                            child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => lokasi()),
                            );
                          },
                          icon: Image.network(item),
                          iconSize: 800,
                        )))
                    .toList(),
              ),
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
                      label: Text("MOJOKERTO",
                          style: TextStyle(color: Colors.grey[700])),
                      icon: Icon(Icons.stars),
                      onPressed: () {},
                    ),
                  ],
                ),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,0),
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: imageMojokerto
                    .map((item) => Center(
                            child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => lokasi()),
                            );
                          },
                          icon: Image.network(item),
                          iconSize: 800,
                        )))
                    .toList(),
              ),
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
                      label: Text("SIDOARJO",
                          style: TextStyle(color: Colors.grey[700])),
                      icon: Icon(Icons.stars),
                      onPressed: () {},
                    ),
                  ],
                ),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,0),
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: imageSidoarjo
                    .map((item) => Center(
                            child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => lokasi()),
                            );
                          },
                          icon: Image.network(item),
                          iconSize: 800,
                        )))
                    .toList(),
              ),
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
                      label: Text("SURABAYA",
                          style: TextStyle(color: Colors.grey[700])),
                      icon: Icon(Icons.stars),
                      onPressed: () {},
                    ),
                  ],
                ),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,0),
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: imageSurabaya
                    .map((item) => Center(
                            child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => lokasi()),
                            );
                          },
                          icon: Image.network(item),
                          iconSize: 800,
                        )))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
