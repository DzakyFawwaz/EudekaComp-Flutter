import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'detail_event.dart';

class EventPromo extends StatelessWidget {
  const EventPromo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigateToDetail(DocumentSnapshot document) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailEvent(
                    document,
                  )));
    }

    return Flexible(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Event').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: snapshot.data.docs.map((document) {
                return GestureDetector(
                  onTap: () {
                    navigateToDetail(document);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20, left: 15, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? MediaQuery.of(context).size.height * 0.35
                        : MediaQuery.of(context).size.height * 0.70,
                    child: Card(
                      child: Stack(
                        children: [
                          Container(
                            height: (MediaQuery.of(context).orientation ==
                                    Orientation.portrait)
                                ? MediaQuery.of(context).size.height * 0.175
                                : MediaQuery.of(context).size.height * 0.35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4)),
                                image: DecorationImage(
                                  image: NetworkImage(document["gambar"]),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            margin: (MediaQuery.of(context).orientation ==
                                    Orientation.portrait)
                                ? EdgeInsets.fromLTRB(
                                    10,
                                    10 +
                                        MediaQuery.of(context).size.height *
                                            0.175,
                                    0,
                                    2)
                                : EdgeInsets.fromLTRB(
                                    10,
                                    10 +
                                        MediaQuery.of(context).size.height *
                                            0.35,
                                    0,
                                    2),
                            child: Text(document["jenis"],
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                          Container(
                            width: (MediaQuery.of(context).orientation ==
                                    Orientation.portrait)
                                ? MediaQuery.of(context).size.width / 1.3
                                : MediaQuery.of(context).size.width / 1.2,
                            margin: (MediaQuery.of(context).orientation ==
                                    Orientation.portrait)
                                ? EdgeInsets.fromLTRB(
                                    10,
                                    10 +
                                        MediaQuery.of(context).size.height *
                                            0.175,
                                    0,
                                    2)
                                : EdgeInsets.fromLTRB(
                                    10,
                                    10 +
                                        MediaQuery.of(context).size.height *
                                            0.4,
                                    0,
                                    2),
                            child: Text(document["judul"],
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 150,
                              margin: EdgeInsets.only(left: 10, bottom: 10),
                              child: Text(document["tanggal"],
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
    );
  }
}
