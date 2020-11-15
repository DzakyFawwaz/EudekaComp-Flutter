import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'detail_fasilitas.dart';

class FasilitasLayanan extends StatelessWidget {
  const FasilitasLayanan({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigateToDetail(DocumentSnapshot document) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailFasilitas(
                    document,
                  )));
    }

    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 20),
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('Fasilitas').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data.docs.map((document) {
                return GestureDetector(
                  onTap: () {
                    navigateToDetail(document);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 150,
                    height: 150,
                    child: Card(
                      child: Stack(
                        children: [
                          Container(
                            width: 150,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4)),
                                image: DecorationImage(
                                  image: NetworkImage(document["gambar"]),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            top: 100.0,
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 90,
                              margin: EdgeInsets.only(left: 10, bottom: 10),
                              child: Text(document["judul"],
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold)),
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
    );
  }
}
