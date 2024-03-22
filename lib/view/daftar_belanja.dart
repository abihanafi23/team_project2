import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_navigation_app/controller/keranjang.dart';
import 'package:listview_navigation_app/model/makanan.dart';
import 'package:provider/provider.dart';

class DaftarBelanja extends StatelessWidget {
  const DaftarBelanja({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    List<Makanan> daftarBelanja = Provider.of<Keranjang>(context).isiKeranjang;
    int totalBelanja = Provider.of<Keranjang>(context, listen: false).total;
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Keranjang", style: GoogleFonts.getFont('Lobster')),
      ),
      body: daftarBelanja.isEmpty
          ? const Center(
              child: Text("Keranjangmu masih kosong!"),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: daftarBelanja.length,
              itemBuilder: (context, index) => Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(daftarBelanja[index].foto),
                      ),
                      title: Text(daftarBelanja[index].nama),
                      subtitle: Text(daftarBelanja[index].keterangan),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Provider.of<Keranjang>(context, listen: false)
                                  .tambahPesanan(daftarBelanja[index]);
                              Provider.of<Keranjang>(context, listen: false)
                                  .hitungTotal();
                            },
                            child: const Icon(Icons.add_circle_rounded),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child:
                                Text((daftarBelanja[index].banyak).toString()),
                          ),
                          GestureDetector(
                              onTap: () {
                                Provider.of<Keranjang>(context, listen: false)
                                    .hapusPesanan(daftarBelanja[index]);
                                Provider.of<Keranjang>(context, listen: false)
                                    .hitungTotal();
                              },
                              child: const Icon(Icons.remove_circle_rounded)),
                        ],
                      ),
                    ),
                  )),
      bottomSheet: SizedBox(
        height: deviceHeight * 0.12,
        width: deviceWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rp. $totalBelanja",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.amber),
                  child: const Text("Bayar"))
            ],
          ),
        ),
      ),
    );
  }
}
