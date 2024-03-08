import 'package:flutter/material.dart';
import 'package:listview_navigation_app/detail_makanan.dart';
import 'package:listview_navigation_app/makanan.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cobaan Puasa',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final List<Makanan> food = [
    Makanan(
        nama: 'Kurma',
        keterangan: 'Ini Kurma',
        foto: 'assets/image1.png',
        Deskripsi:
            'Kurma adalah jenis buah yang bisa tumbuh kapan saja sepanjang tahun.  Buah ini sering dipanen pada musim gugur atau awal musim dingin di negara asalnya '),
    Makanan(
        nama: 'Es Pisang Ijo',
        keterangan: 'Ini Es Pisang Ijo',
        foto: 'assets/image2.png',
        Deskripsi:
            'Es pisang ijo adalah kudapan khas dari makassar, Sulawesi Selatan.  hidangan ini diolah dari buah pisang raja, ambon, atau kepok yang sudah matang'),
    Makanan(
        nama: 'Kolak',
        keterangan: 'Ini Kolak',
        foto: 'assets/image3.png',
        Deskripsi:
            'Kolak adalah makanan penutup khas Indonesia yang berbahan dasar gula aren atau gula kelapa, santan, dan daun pandan'),
    Makanan(
        nama: 'Sop Buah',
        keterangan: 'Ini Sop Buah',
        foto: 'assets/image4.png',
        Deskripsi:
            'Sop Buah adalah sebuah Sop yang disajikan menggunakan buah sebagai bahan utama, dan bisa disajikan saat dingin'),
    Makanan(
        nama: 'Opor Ayam',
        keterangan: 'Ini Opor Ayam',
        foto: 'assets/image5.png',
        Deskripsi:
            'Opor Ayam adalah masakan sejenis kari ayam yang sangat dikenal di Indonesia.  Masakan ini telah dikenal luas di daerah lain'),
  ];

  @override
  Widget build(BuildContext context) {
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
                              textStyle: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber)),
                        ),
                        Text(
                          "Mari tebar kebaikan \ndi bulan yang penuh berkah",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont('Lobster',
                              textStyle: TextStyle(
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
                  textStyle: TextStyle(fontSize: 24)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.55,
            child: ListView.builder(
                itemCount: food.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(food[index].foto),
                    ),
                    title: Text(food[index].nama),
                    subtitle: Text(food[index].keterangan),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailMakanan(
                            foods: food[index],
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green[400]),
              foregroundColor: MaterialStatePropertyAll(Colors.amber)),
          onPressed: () {},
          child: SizedBox(
            width: 105,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.mosque,
                  size: 18,
                ),
                Text(
                  "Waktu Shalat",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          )),
    );
  }
}
