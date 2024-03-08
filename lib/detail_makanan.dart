import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_navigation_app/makanan.dart';

class DetailMakanan extends StatelessWidget {
  final Makanan foods;

  DetailMakanan({required this.foods});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text("Detail Produk"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                foods.foto,
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                foods.nama,
                style: GoogleFonts.getFont('Lobster',
                    textStyle: TextStyle(fontSize: 28, color: Colors.amber)),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  foods.Deskripsi,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
