import 'package:flutter/material.dart';

class DetailTK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Container(
        margin: EdgeInsets.fromLTRB(20, 45, 20, 0),
        child: Text(
          "Tentang Kami",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      Container(
          margin: EdgeInsets.only(top: 10, bottom: 30),
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          child: Image.network(
              "https://smk.dev/wp-content/uploads/sites/3/2020/04/mentoring.png")),
      Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                "Sekilas Tentang SMKDEV",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.blue,
                    fontFamily: 'Poppins'),
              ),
            ),
            Text(
                "SMK.DEV adalah komunitas developer siswa SMK jurusan Rekayasa Perangkat Lunak (RPL), Teknik Komputer dan Jaringan (TKJ) dan Multimedia (MM) dari seluruh Indonesia. Mereka adalah talenta yang bersemangat dan luar biasa berbakat serta kompetitif. Mereka bergabung untuk meningkatkan skill coding, menunjukkan keahlian mereka dan siap merealisasikan kebutuhan aplikasi untuk bisnis Anda. \n \nDidukung komunitas developer siswa SMK dari seluruh Indonesia, Kami siap untuk mewujudkan kebutuhan digital di perusahaan Anda.",
                style: TextStyle(fontFamily: 'Poppins')),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        padding: EdgeInsets.fromLTRB(20, 45, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Icon(
                  Icons.add_location,
                  color: Colors.blue,
                  size: 150,
                )),
            Text("Temui Kami",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'Poppins')),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Column(
                children: [
                  Text("Rumah Sakit SMKDEV",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                  Text("Jl. Margacinta No. 29",
                      style: TextStyle(fontFamily: 'Poppins'))
                ],
              ),
            ),
            Column(
              children: [
                Text("Klinik SMKDEV",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                Text("Jl. Mars Barat I No. 9",
                    style: TextStyle(fontFamily: 'Poppins'))
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 60, bottom: 10),
                child: Icon(
                  Icons.phone_iphone,
                  color: Colors.blue,
                  size: 150,
                )),
            Text("Layanan Darurat",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'Poppins')),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text("Unit Gawat Darurat Umum",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                  Text("Setiap Hari 24 jam",
                      style: TextStyle(fontFamily: 'Poppins'))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text("Ambulans Siaga",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                  Text(" +622 7000 0000",
                      style: TextStyle(fontFamily: 'Poppins')),
                  Text(" +622 7000 0000")
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 60, bottom: 10),
                child: Icon(
                  Icons.access_time,
                  color: Colors.blue,
                  size: 150,
                )),
            Text("Waktu Operasional",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'Poppins')),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text("Rumah Sakit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                  Text("Senin - Jumat : 08.00 - 20.00",
                      style: TextStyle(fontFamily: 'Poppins')),
                  Text("Sabtu : 08.00 - 17.00")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text("Klinik",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                  Text("Senin - Jumat : 08.00 - 20.00",
                      style: TextStyle(fontFamily: 'Poppins')),
                  Text("Sabtu : 08.00 - 13.00")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 30),
              child: Column(
                children: [
                  Text("BPJS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                  Text("Senin - Jumat : 07.00 - 214.00, 16.00 - 19.00",
                      style: TextStyle(fontFamily: 'Poppins')),
                  Text("Sabtu : 087.00 - 12.00")
                ],
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
