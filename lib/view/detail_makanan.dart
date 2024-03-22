import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_navigation_app/controller/keranjang.dart';
import 'package:listview_navigation_app/model/makanan.dart';
import 'package:provider/provider.dart';

class DetailMakanan extends StatelessWidget {
  const DetailMakanan({super.key});

  @override
  Widget build(BuildContext context) {
    final Makanan foods = ModalRoute.of(context)?.settings.arguments as Makanan;
    int banyakMakanan = Provider.of<Keranjang>(context).isiKeranjang.length;
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(
          "Detail Produk",
          style: GoogleFonts.getFont('Lobster'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
                onTap: () {
                  Provider.of<Keranjang>(context, listen: false).hitungTotal();
                  Navigator.pushNamed(context, '/belanja');
                },
                child: SizedBox(
                  width: 30,
                  height: 50,
                  child: Stack(children: [
                    const Positioned(
                        bottom: 15,
                        child: Icon(Icons.shopping_cart_checkout_rounded)),
                    Positioned(
                        bottom: 25,
                        left: 10,
                        child: Container(
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red),
                          child: Center(
                            child: Text(banyakMakanan.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ))
                  ]),
                )),
          )
        ],
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
            const SizedBox(
              height: 50,
            ),
            Text(
              foods.nama,
              style: GoogleFonts.getFont('Lobster',
                  textStyle:
                      const TextStyle(fontSize: 28, color: Colors.amber)),
              textAlign: TextAlign.center,
            ),
            Text(
              foods.keterangan,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                foods.deskripsi,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        splashColor: Colors.amber,
        onPressed: () {
          Provider.of<Keranjang>(context, listen: false).tambahPesanan(foods);
        },
        child: const Icon(Icons.add_shopping_cart_rounded),
      ),
    );
  }
}
