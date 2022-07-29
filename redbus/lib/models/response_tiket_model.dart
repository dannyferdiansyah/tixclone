// To parse this JSON data, do
//
//     final pesananTiket = pesananTiketFromJson(jsonString);

import 'dart:convert';

List<PesananTiket> pesananTiketFromJson(String str) => List<PesananTiket>.from(
    json.decode(str).map((x) => PesananTiket.fromJson(x)));

String pesananTiketToJson(List<PesananTiket> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PesananTiket {
  PesananTiket({
    required this.id,
    required this.image,
    required this.jam,
    required this.harga,
    required this.estimasi,
    required this.namabis,
    required this.tipebis,
    required this.tujuan,
  });

  String id;
  String image;
  String jam;
  String harga;
  String estimasi;
  String namabis;
  String tipebis;
  String tujuan;

  factory PesananTiket.fromJson(Map<String, dynamic> json) => PesananTiket(
        id: json["id"],
        image: json["image"],
        jam: json["jam"],
        harga: json["harga"],
        estimasi: json["estimasi"],
        namabis: json["namabis"],
        tipebis: json["tipebis"],
        tujuan: json["tujuan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "jam": jam,
        "harga": harga,
        "estimasi": estimasi,
        "namabis": namabis,
        "tipebis": tipebis,
        "tujuan": tujuan,
      };
}
