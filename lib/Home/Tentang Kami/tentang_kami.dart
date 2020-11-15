import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eudeka_comp/booking/detail_booking.dart';
import 'package:flutter/material.dart';

import 'detail_tentang_kami.dart';

class TentangKami extends StatefulWidget {
  @override
  _TentangKamiState createState() => _TentangKamiState();
}

class _TentangKamiState extends State<TentangKami> {
  navigateToDetail(DocumentSnapshot document) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailBooking(
                  document,
                )));
  }

  QuerySnapshot dokterSnapshot;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tentang Kami",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailTK();
                    }));
                  },
                  child: Text("Selengkapnya",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      )),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).orientation == Orientation.portrait)
                ? 230
                : 320,
            child: CachedNetworkImage(
              imageUrl:
                  'https://smk.dev/wp-content/uploads/sites/3/2020/04/mentoring.png',
              placeholder: (context, url) =>
                  Center(child: new CircularProgressIndicator()),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
          //List View
          Container(
            margin: EdgeInsets.only(left: 20, bottom: 20),
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('Dokter').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  return (!snapshot.hasData)
                      ? CircularProgressIndicator()
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          children: snapshot.data.docs.map((document) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (contex) {
                                  return DetailBooking(document);
                                }));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 150,
                                height: (MediaQuery.of(context).orientation ==
                                        Orientation.portrait)
                                    ? 150
                                    : 100,
                                child: Card(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 150,
                                        height: (MediaQuery.of(context)
                                                    .orientation ==
                                                Orientation.portrait)
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.175
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.3,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4),
                                                topRight: Radius.circular(4)),
                                            image: DecorationImage(
                                              image:
                                                  NetworkImage(document["ava"]),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: (MediaQuery.of(context)
                                                          .orientation ==
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
                                              child: Text(document["nama"],
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                            ),
                                          ]),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          width: 80,
                                          margin: EdgeInsets.only(
                                              left: 10, bottom: 10),
                                          child: Text(document["spesialis"],
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                }),
          )
        ],
      ),
    );
  }
}
