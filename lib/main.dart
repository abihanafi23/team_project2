import 'package:flutter/material.dart';
import 'package:listview_navigation_app/controller/keranjang.dart';
import 'package:listview_navigation_app/view/daftar_belanja.dart';
import 'package:listview_navigation_app/view/detail_makanan.dart';
import 'package:listview_navigation_app/view/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Keranjang(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cobaan Puasa',
        routes: {
          '/main': (context) => const MainPage(),
          '/detail': (context) => const DetailMakanan(),
          '/belanja' : (context) => const DaftarBelanja() 
        },
        initialRoute: '/main',
      ),
    );
  }
}