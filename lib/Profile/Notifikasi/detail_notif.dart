import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailNotif extends StatelessWidget {
  final DocumentSnapshot document;
  DetailNotif(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 45, 20, 0),
        child: Column(children: [
          Container(
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Detail",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(children: [
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(document.data()["jenis"] ?? '',
                      style: TextStyle(
                          color: Colors.blue, fontFamily: 'Poppins'))),
              Text(document.data()["judul"] ?? '',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              Text(document.data()["tanggal"] ?? '',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 15, color: Colors.grey)),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Container(
                        width: 70,
                        child: Text(
                          document.data()["detail-waktu"] ?? '',
                          maxLines: 2,
                          style: TextStyle(fontSize: 17),
                        )),
                    SizedBox(
                      width: 2,
                      height: 70,
                      child: Container(color: Colors.grey[300]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5, bottom: 4),
                                child: Text("Rumah Sakit SMKDEV",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800)),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text("Jl. Margacinta Np. 29",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(document.data()['deskripsi-detail'] ?? '',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    )),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
