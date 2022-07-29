// To parse this JSON data, do
//
//     final apilokasi = apilokasiFromJson(jsonString);

import 'dart:convert';

Apilokasi apilokasiFromJson(String str) => Apilokasi.fromJson(json.decode(str));

String apilokasiToJson(Apilokasi data) => json.encode(data.toJson());

class Apilokasi {
    Apilokasi({
        required this.id,
        required this.nama,
        required this.bioskop1,
        required this.bioskop2,
        required this.bioskop3,
    });

    String id;
    String nama;
    String bioskop1;
    String bioskop2;
    String bioskop3;

    factory Apilokasi.fromJson(Map<String, dynamic> json) => Apilokasi(
        id: json["id"],
        nama: json["nama"],
        bioskop1: json["bioskop1"],
        bioskop2: json["bioskop2"],
        bioskop3: json["bioskop3"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "bioskop1": bioskop1,
        "bioskop2": bioskop2,
        "bioskop3": bioskop3,
    };
}
