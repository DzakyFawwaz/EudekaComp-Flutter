import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailFasilitas extends StatelessWidget {
  final DocumentSnapshot document;

  DetailFasilitas(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200.0,
          floating: true,
          pinned: false,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title: Text(
            'Fasilitas & Layanan',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          flexibleSpace: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: document.data()['gambar'],
            placeholder: (context, url) =>
                Center(child: new CircularProgressIndicator()),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
        ),
        SliverFillRemaining(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 20, left: 20),
                        child: Text(document.data()["jenis"] ?? '',
                            style: TextStyle(
                                color: Colors.blue, fontFamily: 'Poppins'))),
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 20),
                      child: Text(document.data()["judul"] ?? '',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 20),
                      child: Text(document.data()["tanggal"] ?? '',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Colors.grey)),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 20, top: 20),
                      child: Text(document.data()['deskripsi-detail'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
