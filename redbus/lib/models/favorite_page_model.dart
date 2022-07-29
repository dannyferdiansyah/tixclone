import 'namabus.dart';
import 'package:flutter/foundation.dart';

class FavoritePageModel extends ChangeNotifier {
  late namaBus _namaBus;
  final List<int> _itemIds = [];
  namaBus get namaBusList => _namaBus;

  set namaBusList(namaBus newList) {
    _namaBus = newList;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _namaBus.getById(id)).toList();

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}