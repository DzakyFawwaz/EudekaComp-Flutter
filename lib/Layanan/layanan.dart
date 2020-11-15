import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Event Promo/event_promo.dart';
import 'Fasilitas Layanan/fasilitas_layanan.dart';

class Layanan extends StatefulWidget {
  @override
  _LayananState createState() => _LayananState();
}

class _LayananState extends State<Layanan> {
  TextEditingController searchController = TextEditingController();
  QuerySnapshot searchSnapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
            child: Text(
              "Layanan",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'Poppins'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search dokter, fasilitas & layanan ",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontFamily: 'Poppins', fontSize: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  )),
              controller: searchController,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text(
              "Fasilitas & Layanan",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Poppins'),
            ),
          ),
          FasilitasLayanan(),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Text(
              "Event & Promo",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Poppins'),
            ),
          ),
          EventPromo()
        ],
      ),
    );
  }
}
