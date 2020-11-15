import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'detail_booking.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  navigateToDetail(DocumentSnapshot document) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailBooking(
                  document,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 45, 20, 0),
            child: Text(
              "Booking",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Expanded(
              child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Dokter').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return (!snapshot.hasData)
                  ? Center(child: CircularProgressIndicator())
                  : ListView(
                      children: snapshot.data.docs.map((document) {
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
                                      document["ava"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(document["nama"],
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Text(
                                        document["spesialis"],
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Poppins',
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
            },
          ))
        ],
      ),
    );
  }
}
