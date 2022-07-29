// import 'dart:convert';
// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:redbus/models/favorite_page_model.dart';
// import 'package:redbus/models/namabus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class busStage extends StatefulWidget {
//   const busStage({Key? key}) : super(key: key);

//   @override
//   State<busStage> createState() => _busStageState();
// }

// class _busStageState extends State<busStage> {
//   final namaBusC = Get.put(namaBus());

//   bool isDark = false;

//   saveToLocalStorage() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool("isDark", isDark);
//   }

//   getLocalData() async {
//     final prefs = await SharedPreferences.getInstance();
//     isDark = prefs.getBool("isDark") ?? false;
//     setState(() {});
//   }

//   Future<List> getData() async {
//     final response = await http.get(Uri.parse("http://127.0.0.1/pesanantiket/getdata.php"));
//     return jsonDecode(response.body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tujuan Anda'),
//         actions: [
//           Container(
//             margin: EdgeInsets.only(right: 15),
//             child: InkWell(
//               child: isDark
//                   ? const Icon(Icons.light_mode)
//                   : const Icon(Icons.dark_mode),
//               onTap: () {
//                 isDark = !isDark;
//                 saveToLocalStorage();
//                 setState(() {});
//               },
//             ),
//           )
//         ],
//         backgroundColor: isDark
//             ? Color.fromARGB(255, 105, 105, 105)
//             : Color.fromRGBO(213, 79, 88, 1),
//       ),
//       backgroundColor: Colors.white,
//       body: new FutureBuilder<List>(
//         future: getData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) print(snapshot.error);
//           return snapshot.hasData
//               ? new ItemList(
//                   list: snapshot.data,
//                 )
//               : new Center(
//                   child: new CircularProgressIndicator(),
//                 );
//         },
//       ),
//       bottomNavigationBar: getNavbar(),
//     );
//   }

//   // Widget getBody() {
//   //   return Scaffold(
//   //     body: new FutureBuilder<List>(
//   //       future: getData(),
//   //       builder: context, snapshot) {
          
//   //       },
//   //   //     body: CustomScrollView(
//   //   //   slivers: [
//   //   //     SliverAppBar(
//   //   //       title: Text('List Bus',
//   //   //           style: TextStyle(color: Colors.white, fontSize: 22)),
//   //   //       floating: true,
//   //   //       actions: [
//   //   //         IconButton(
//   //   //             onPressed: () => Navigator.pushNamed(context, '/tiket'),
//   //   //             icon: Icon(Icons.airplane_ticket))
//   //   //       ],
//   //   //     ),
//   //   //     const SliverToBoxAdapter(child: SizedBox(height: 12)),
//   //   //     SliverList(
//   //   //       delegate:
//   //   //           SliverChildBuilderDelegate((BuildContext context, int index) {
//   //   //         return _MyListItem(index);
//   //   //       }, childCount: 12),
//   //   //     )
//   //   //   ],
//   //   // )
//   //       // body: ListView.builder(
//   //       //   itemCount: 1,
//   //       //   itemBuilder: (context, index) => Container(
//   //       //     color: Colors.white,
//   //       //     margin: const EdgeInsets.fromLTRB(10, 8, 10, 0),
//   //       //     width: 400,
//   //       //     height: 800,
//   //       //     child: ListView(
//   //       //       children: namaBusC.panggil.map((danny) {
//   //       //       return Column(
//   //       //         crossAxisAlignment: CrossAxisAlignment.stretch,
//   //       //         children: [
//   //       //           Image.network(
//   //       //             "${danny['Image']}",
//   //       //             width: 45,
//   //       //             height: 50,
//   //       //             alignment: Alignment.topLeft,
//   //       //           ),
//   //       //           Text(
//   //       //             " ${danny['Jam']}\t\t\t\t\t\t${danny['Harga']}",
//   //       //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//   //       //           ),
//   //       //           Text(
//   //       //             " ${danny['Estimasi']} - ${danny['Tersedia']} tempat duduk tersedia\n",
//   //       //             style: TextStyle(
//   //       //                 fontSize: 12,
//   //       //                 fontWeight: FontWeight.w400,
//   //       //                 color: Colors.grey),
//   //       //           ),
//   //       //           Text(
//   //       //             " ${danny['Nbis']} , ${danny['Tipe']}",
//   //       //             style: TextStyle(
//   //       //                 fontSize: 12,
//   //       //                 fontWeight: FontWeight.w600,
//   //       //                 color: Colors.black),
//   //       //           ),
//   //       //           Text(
//   //       //             " ${danny['Tujuan']}",
//   //       //             style: TextStyle(
//   //       //                 fontSize: 12,
//   //       //                 fontWeight: FontWeight.w400,
//   //       //                 color: Colors.grey),
//   //       //           ),
//   //       //           SizedBox(
//   //       //             height: 10,
//   //       //           ),
//   //       //           RaisedButton(
//   //       //             color: isDark ? Color.fromARGB(255, 105, 105, 105) : Color.fromRGBO(213, 79, 88, 1),
//   //       //               onPressed: () {}, child: const Text("Booking Tiket", style: TextStyle(color: Colors.white),)),
//   //       //           SizedBox(
//   //       //             height: 10,
//   //       //           )
//   //       //         ],
//   //       //       );
//   //       //     }).toList()),
//   //       //   ),
//   //       // ),
//   //       );
//   // }

//   Widget getNavbar() {
//     int currentIndex = 0;
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: Colors.black,
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.grey,
//       iconSize: 30,
//       currentIndex: currentIndex,
//       onTap: (index) => setState(() => currentIndex = index),
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.person,
//           ),
//           label: 'Operator Bus',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.sunny_snowing),
//           label: '06.00 - 11.59',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.sunny),
//           label: '12.00 - 17.59',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.mode_night_outlined),
//           label: '18.00 - 05.59',
//         ),
//       ],
//     );
//   }
// }

// class _MyListItem extends StatelessWidget {
//   final int index;

//   const _MyListItem(this.index, {Key? key}) : super(key: key);

//   Widget build(BuildContext context) {
//     var item = context.select<namaBus, Item>(
//       (namaBus) => namaBus.getByPosition(index),
//     );

//     var textTheme = Theme.of(context).textTheme.headline6;

//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//         child: LimitedBox(
//             maxHeight: 140,
//             child: Row(
//               children: [
//                 AspectRatio(aspectRatio: 1, child: Image.network(item.image)),
//                 const SizedBox(width: 1),
//                 Expanded(
//                     child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       item.jam + "\t\t\t\t\t\t" + item.harga,
//                       style: TextStyle(color: Colors.black, fontSize: 16),
//                     ),
//                     Text(
//                       item.estimasi,
//                       style: TextStyle(color: Colors.grey, fontSize: 12),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       item.nama + ",\t\t\t\t\t\t" + item.tipe,
//                       style: TextStyle(color: Colors.black, fontSize: 12),
//                     ),
//                     Text(
//                       item.tujuan,
//                       style: TextStyle(color: Colors.grey, fontSize: 12),
//                     ),
//                     SizedBox(
//                       height: 3,
//                     ),
//                     _AddButton(item: item),
//                     // RaisedButton(
//                     //     color: Color.fromRGBO(213, 79, 88, 1),
//                     //     onPressed: () {},
//                     //     child: const Text(
//                     //       "Booking Tiket",
//                     //       style: TextStyle(color: Colors.white),
//                     //     )),
//                   ],
//                 ))
//               ],
//             )));
//   }
// }

// class _AddButton extends StatelessWidget {
//   final Item item;

//   const _AddButton({required this.item, Key? key}) : super(key: key);

//   Widget build(BuildContext context) {
//     var isInTiketPage = context.select<FavoritePageModel, bool>(
//       (tiket) => tiket.items.contains(item),
//     );

//     return Center(
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           primary: isInTiketPage ? Colors.red : Colors.grey,
//         ),
//         onPressed: isInTiketPage
//         ? () {
//           var tiketpage = context.read<FavoritePageModel>();
//           tiketpage.remove(item);
//         }
//         : () {
//           var tiketpage = context.read<FavoritePageModel>();
//           tiketpage.add(item);
//         }, child: Text('Booking Tiket', style: TextStyle(fontSize: 20),),
//       ),
//     );

    // return Center(
    //   child: IconButton(
    //     icon: isInTiketPage 
    //         ? Icon(Icons.add_shopping_cart, color: Colors.red)
    //         : Icon(Icons.add_shopping_cart_sharp),
    //     onPressed: isInTiketPage 
    //     ? () {
    //       var tiketpage = context.read<FavoritePageModel>();
    //       tiketpage.remove(item);
    //     }
    //     : () {
    //       var tiketpage = context.read<FavoritePageModel>();
    //       tiketpage.add(item);
    //     }
    //   ),
    // );
//   }
// }