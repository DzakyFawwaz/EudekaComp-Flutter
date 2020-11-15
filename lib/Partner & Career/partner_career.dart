import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eudeka_comp/Partner%20&%20Career/detail_partner_career.dart';
import 'package:flutter/material.dart';

class PartnerCareer extends StatefulWidget {
  @override
  _PartnerCareerState createState() => _PartnerCareerState();
}

class _PartnerCareerState extends State<PartnerCareer> {
  TextEditingController searchController = TextEditingController();
  QuerySnapshot searchSnapshot;

  @override
  Widget build(BuildContext context) {
    navigateToDetail(DocumentSnapshot document) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPartner(
                    document,
                  )));
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: Text(
                "Partner & Career",
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
                    hintText: "Search Event & Promo ",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontSize: 15),
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
                "Partner",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Poppins'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 20),
              height: 150,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Partner')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data.docs.map((document) {
                        return GestureDetector(
                          onTap: navigateToDetail(document),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(document["gambar"]),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        );
                      }).toList(),
                    );
                  }),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Lowongan",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Poppins'),
                ),
              ),
            ),
            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Lowongan')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
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
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.only(
                                right: 20, left: 15, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3.1,
                            child: Stack(
                              children: [
                                Container(
                                  height: (MediaQuery.of(context).size.height *
                                      0.175),
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
                                  margin: EdgeInsets.fromLTRB(
                                      10,
                                      10 +
                                          MediaQuery.of(context).size.height *
                                              0.175,
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  margin: EdgeInsets.fromLTRB(
                                      10,
                                      30 +
                                          MediaQuery.of(context).size.height *
                                              0.175,
                                      0,
                                      0),
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
                                    margin:
                                        EdgeInsets.only(left: 10, bottom: 10),
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
                        );
                      }).toList(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
