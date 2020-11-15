import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final List<String> imgList = [
  'https://disk.mediaindonesia.com/thumbs/1800x1200/news/2020/09/77a9899ecc2a202063b55692f0540c2f.jpg',
  'https://asset.kompas.com/crops/0VBWGgPRfRCps8DjSORU6mQAkng=/0x0:780x520/355x237/data/photo/2020/11/11/5fabf8fa572ce.png',
  'https://asset.kompas.com/crops/SWeBXzOsg3WW66j5XSWx0jr04qI=/0x0:1000x667/750x500/data/photo/2020/10/17/5f8a871ca01ef.jpg',
];

List<String> listURL = [
  'https://health.detik.com/berita-detikhealth/d-5190580/waspada-makin-banyak-yang-tertular-covid-19-dari-orang-terdekat',
  'https://health.kompas.com/read/2020/11/12/070200868/terlalu-lama-menatap-layar-selama-wfh-dan-belajar-online-waspada-sindrom-ini',
  'https://www.kompas.com/sains/read/2020/10/17/130716823/masih-ragu-dengan-vaksin-simak-dan-cermati-5-penjelasan-ahli-ini'
];

List<String> listJudul = [
  'Waspada COVID-19',
  'Terlalu Lama Menatap Layar Selama WFH dan Belajar Online, Waspada Sindrom Ini',
  'Masih Ragu dengan Vaksin? Simak dan Cermati 5 Penjelasan Ahli Ini'
];

List<String> deskripsi = [
  'Virus Corona COVID-19 terasa makin nyata ketika penularan tak lagi terjadi di keramaian. Banyak kasus penularan kini terjadi di lingkaran orang terdekat.',
  'Situasi pandemi Covid-19 yang merebak di seluruh dunia membuat sebagian besar perusahaan dan institusi mengambil kebijakan work from home (WFH) bagi para pegawainya.',
  'Mungkin Anda adalah salah seorang yang meragukan manfaat vaksin atau imunisasi dan menolak melakukan imunisasi.'
];

int _current = 0;

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  Stream<QuerySnapshot> user =
      FirebaseFirestore.instance.collection("Berita").snapshots();
  AsyncSnapshot<QuerySnapshot> snapshot;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(alignment: AlignmentDirectional.bottomStart, children: [
      // Setting Carousel
      Container(
          child: CarouselSlider.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              // Image
              Container(
                child: CachedNetworkImage(
                  imageUrl: imgList[index],
                  placeholder: (context, url) =>
                      Center(child: new CircularProgressIndicator()),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
              // Shadow
              Positioned(
                top: 100.0,
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
              ),
              // Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 40, 10, 10),
                    child: Text(
                      listJudul[index],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    margin: EdgeInsets.only(top: 15, left: 20),
                    child: Text(
                      deskripsi[index],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),

              // Button
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () async => await openUrl(listURL[index],
                      enableJavaScript: true, forceWebView: true),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                    width: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? size.width / 8
                        : size.width / 9,
                    height: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? size.height / 30
                        : size.height / 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        splashColor: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(20),
                        child: Center(
                          child: Text(
                            "Read",
                            style: TextStyle(
                                fontSize: (MediaQuery.of(context).orientation ==
                                        Orientation.portrait)
                                    ? size.width / 30
                                    : size.width / 45,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
        options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(milliseconds: 4000),
            enlargeCenterPage: false,
            aspectRatio: 1.5,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      )),
      Container(
        alignment: Alignment.bottomLeft,
        margin: EdgeInsets.only(
          left: (MediaQuery.of(context).orientation == Orientation.portrait)
              ? size.width / 20
              : size.width / 8,
          bottom: 20,
        ),
        child: Row(
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 7.0,
              height: 7.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.blue : Colors.white70,
              ),
            );
          }).toList(),
        ),
      ),
    ]);
  }

  Future<void> openUrl(String url,
      {bool forceWebView = false, bool enableJavaScript = false}) async {
    await launch(url,
        forceWebView: forceWebView, enableJavaScript: enableJavaScript);
  }
}
