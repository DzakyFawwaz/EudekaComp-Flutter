import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoriBooking extends StatelessWidget {
  const HistoriBooking({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Booking').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snaphsot) {
          return (!snaphsot.hasData)
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: snaphsot.data.docs.map((document) {
                    return Container(
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
                                document["doc-ava"],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(document["dokter"],
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                Text(
                                  document["spesialis"],
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(document['booking-time'],
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
                                            color: Colors.amber[600]),
                                        child: Text(document['date'],
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
                    );
                  }).toList(),
                );
        });
  }
}
