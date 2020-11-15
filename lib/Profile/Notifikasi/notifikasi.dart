import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eudeka_comp/Profile/Notifikasi/detail_notif.dart';
import 'package:flutter/material.dart';

class Notifikasi extends StatelessWidget {
  const Notifikasi({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigateToDetail(DocumentSnapshot document) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailNotif(
                    document,
                  )));
    }

    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Notifikasi').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snaphsot) {
          return (!snaphsot.hasData)
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: snaphsot.data.docs.map((document) {
                    return GestureDetector(
                      onTap: () {
                        navigateToDetail(document);
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                width: 50,
                                height: 50,
                                child: Image.network(
                                  document["gambar"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(document["judul"],
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  Container(
                                    width: 220,
                                    child: Text(
                                      document["deskripsi"],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.45,
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(document['notif-time'],
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                              fontFamily: 'Poppins',
                                            )),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(7, 2, 7, 2),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.red),
                                          child: Text(document['ket'],
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
        });
  }
}
