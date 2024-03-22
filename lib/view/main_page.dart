import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_navigation_app/model/data_makanan.dart';
import 'package:listview_navigation_app/controller/keranjang.dart';
import 'package:listview_navigation_app/model/makanan.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Makanan> foods = DataMakanan().food;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: deviceHeight * 0.35,
              child: Stack(
                children: [
                  Image.asset('assets/bg2.jpg'),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Ramadhan Kareem",
                            style: GoogleFonts.getFont('Lobster',
                                textStyle: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber)),
                          ),
                          Text(
                            "Mari tebar kebaikan \ndi bulan yang penuh berkah",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont('Lobster',
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Daftar Produk",
                style: GoogleFonts.getFont('Lobster',
                    textStyle: const TextStyle(fontSize: 24)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.55,
              child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 50),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(foods[index].foto),
                      ),
                      title: Text(foods[index].nama),
                      subtitle: Text(foods[index].keterangan),
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: foods[index]);
                      },
                      trailing: TextButton(
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.green),
                        onPressed: () {
                          Provider.of<Keranjang>(context, listen: false)
                              .tambahPesanan(foods[index]);
                        },
                        child: const Icon(
                          Icons.add_shopping_cart_rounded,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
        floatingActionButton: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
                foregroundColor: Colors.amber),
            onPressed: () {
              Provider.of<Keranjang>(context, listen: false)
                                    .hitungTotal();
              Navigator.pushNamed(context, '/belanja');
            },
            child: const SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_cart_checkout_rounded,
                    size: 22,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Lihat Keranjang",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )),
    );
  }
}
