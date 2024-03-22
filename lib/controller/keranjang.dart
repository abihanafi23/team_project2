import 'package:flutter/material.dart';
import 'package:listview_navigation_app/model/makanan.dart';

class Keranjang with ChangeNotifier {
  int total = 0;
  final List<Makanan> _isiKeranjang = [];

  List<Makanan> get isiKeranjang => _isiKeranjang;

  void tambahPesanan(Makanan makanan) {
    if (_isiKeranjang.contains(makanan)) {
      makanan.banyak++;
    } else {
      isiKeranjang.add(makanan);
    }
    notifyListeners();
  }

  void hapusPesanan(Makanan makanan) {
    if (makanan.banyak > 1) {
      makanan.banyak--;
    } else {
      isiKeranjang.remove(makanan);
    }
    notifyListeners();
  }

  void hitungTotal() {
    total = 0;
    if (_isiKeranjang.isNotEmpty) {
      for (int i = 0; i < _isiKeranjang.length; i++) {
        total = total + (_isiKeranjang[i].harga * _isiKeranjang[i].banyak);
      }
    }
    notifyListeners();
  }
}
