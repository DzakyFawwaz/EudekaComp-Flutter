import 'package:eudeka_comp/Home/gmap.dart';
import 'package:flutter/material.dart';

class TemuiKami extends StatefulWidget {
  @override
  _TemuiKamiState createState() => _TemuiKamiState();
}

class _TemuiKamiState extends State<TemuiKami> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, top: 25, bottom: 10),
          child: Text("Temui Kami",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold)),
        ),
        Container(
            // padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            width: MediaQuery.of(context).size.width,
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                GoogleMaps(),
                Positioned(
                  top: 100.0,
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  // width: MediaQuery.of(context).size.width,
                  height: 90,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "images/hospital.jpg",
                              fit: BoxFit.cover,
                            )),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "RS. SMKDEV",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Container(
                            width: 150,
                            child: Text(
                                "Jl. Margacinta No. 29, Buah Batu, Bandung",
                                maxLines: 2,
                                style: (TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.grey,
                                    fontSize: 13))),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rumah Sakit SMKDEV",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("Jl. Margacinta No. 29"),
                    Text("Senin - Jumat : 08.00 - 20.00"),
                    Text("Sabtu : 08.00 - 17.00")
                  ],
                ),
              ),
              Container(
                height: 80,
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Klinik SMKDEV",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("Jl. Mars Barat I No. 9"),
                    Text("Senin - Jumat : 08.00 - 20.00"),
                    Text("Sabtu : 08.00 - 13.00")
                  ],
                ),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BPJS",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("Senin - Jumat : 07.00 - 14.00, 16.00 - 19.00"),
                    Text("Sabtu : 07.00 - 12.00"),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
