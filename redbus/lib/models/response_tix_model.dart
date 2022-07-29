// To parse this JSON data, do
//
//     final apitix = apitixFromJson(jsonString);

import 'dart:convert';

Apitix apitixFromJson(String str) => Apitix.fromJson(json.decode(str));

String apitixToJson(Apitix data) => json.encode(data.toJson());

class Apitix {
    Apitix({
        required this.id,
        required this.nama,
        required this.image,
        required this.durasi,
        required this.harga,
        required this.kursi,
    });

    String id;
    String nama;
    String image;
    String durasi;
    String harga;
    String kursi;

    factory Apitix.fromJson(Map<String, dynamic> json) => Apitix(
        id: json["id"],
        nama: json["nama"],
        image: json["image"],
        durasi: json["durasi"],
        harga: json["harga"],
        kursi: json["kursi"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "image": image,
        "durasi": durasi,
        "harga": harga,
        "kursi": kursi,
    };
}
