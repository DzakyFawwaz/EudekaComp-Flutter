import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final List<Widget> data = [
  Text('paja'),
  Text('jaki'),
  Container(
    width: 20,
    height: 20,
    color: Colors.amber,
  ),
];

class Recyclerview extends StatelessWidget {
  Future<List<DocumentSnapshot>> getData() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn =
        await firestore.collection("Dokter").where("jadwal").get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length.compareTo(0),
                  itemBuilder: (_, index) {
                    DocumentSnapshot user = snapshot.data[index];
                    return Text(
                      user.data()['jadwal'][index].toString(),
                    );
                  }),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
