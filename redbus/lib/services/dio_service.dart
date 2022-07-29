import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class dioService {
  static const String url = "https://apitix.herokuapp.com/";

  Future post(
    String nama,
    String image,
    String durasi,
    String harga,
    String kursi,
  ) async {
    var dio = Dio();

    try {
      final result = dio.post(
        url,
        data: jsonEncode({
          "nama": nama,
          "image": image,
          "durasi": durasi,
          "harga": harga,
          "kursi": kursi,
        }),
      );
      Get.snackbar("Berhasil", "Create Data Berhasil");
    } catch (e) {
      print(e);
      Get.snackbar("Gagal", "Create Data Gagal");
    }
  }

  Future delete(String id) async {
    var dio = Dio();

    try {
      final result = await dio.delete(
        "https://apitix.herokuapp.com/$id",
      );
      Get.snackbar("Berhasil", "Delete Data Berhasil");
    } catch (e) {
      print(e);
      Get.snackbar("Gagal", "Delete Data Gagal");
    }
  }

  Future update(
    String id,
    String nama,
    String image,
    String durasi,
    String harga,
    String kursi,
  ) async {
    var dio = Dio();

    try {
      final result = await dio.patch("https://apitix.herokuapp.com/$id",
          data: jsonEncode({
            "nama": nama,
            "image": image,
            "durasi": durasi,
            "harga": harga,
            "kursi": kursi,
          }));
      Get.snackbar("Berhasil", "Berhasil Update Data");
    } catch (e) {
      Get.snackbar("Gagal", "Gagal Update Data, Error = ${e}");
    }
  }
}
