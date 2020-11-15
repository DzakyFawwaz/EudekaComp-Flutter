import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BeritaTerbaru extends StatefulWidget {
  @override
  _BeritaTerbaruState createState() => _BeritaTerbaruState();
}

class _BeritaTerbaruState extends State<BeritaTerbaru> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Text("Berita Terbaru",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 20),
          height: 220,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Berita').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data.docs.map((document) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 250,
                      height: 150,
                      child: Card(
                        child: Stack(
                          children: [
                            Container(
                              width: 250,
                              height: (MediaQuery.of(context).orientation ==
                                      Orientation.portrait)
                                  ? MediaQuery.of(context).size.height * 0.175
                                  : MediaQuery.of(context).size.height * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4)),
                                  image: DecorationImage(
                                    image: NetworkImage(document["gambar"]),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        (MediaQuery.of(context).orientation ==
                                                Orientation.portrait)
                                            ? EdgeInsets.fromLTRB(
                                                10,
                                                10 +
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.175,
                                                0,
                                                2)
                                            : EdgeInsets.fromLTRB(
                                                10,
                                                10 +
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.3,
                                                0,
                                                2),
                                    child: Text(document["judul"],
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ),
                                ]),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.only(left: 10, bottom: 10),
                                child: Text(document["deskripsi"],
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
        )
      ],
    );
  }
}
