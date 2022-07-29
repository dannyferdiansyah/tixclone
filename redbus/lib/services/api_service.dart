import 'dart:convert';

import 'package:TIXCLONE/models/response_tix_model.dart';
import 'package:http/http.dart' as http;

import '../models/response_lokasi_model.dart';

class apiService {
  final String _url = 'https://apitix.herokuapp.com/';
  final String _uurl = 'https://apilokasi.herokuapp.com/';

  Future getData() async {
    Uri urlApi = Uri.parse(_url);

    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      Iterable it = jsonDecode(response.body);
      List<Apitix> pesanan =
          it.map((e) => Apitix.fromJson(e)).toList();
      return pesanan;
      // return pesananTiketFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load tiket!");
    }
  }

  Future getLokasi() async {
    Uri urlApi = Uri.parse(_uurl);

    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      Iterable it = jsonDecode(response.body);
      List<Apilokasi> pesanan =
          it.map((e) => Apilokasi.fromJson(e)).toList();
      return pesanan;
      // return pesananTiketFromJson(response.body.toString());
    } else {
      throw Exception("Failed to load tiket!");
    }
  }
}
