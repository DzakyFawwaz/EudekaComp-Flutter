import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eudeka_comp/Booking/success_booking.dart';
import 'package:eudeka_comp/Database/db.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ganti_pasien.dart';

class BookingConfirm extends StatefulWidget {
  final DocumentSnapshot document;
  // confirmDocument

  BookingConfirm(
    this.document,
  );

  @override
  _BookingConfirmState createState() => _BookingConfirmState();
}

class _BookingConfirmState extends State<BookingConfirm> {
  DateTime _dateTime;
  String dateFormate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  final DateFormat formatter = DateFormat("dd-MM-yyyy");
  final TextEditingController _controllerPesan = TextEditingController();

  DocumentReference documentReference =
      FirebaseFirestore.instance.collection('Pasien').doc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              floating: true,
              expandedHeight: 200,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                child: Icon(Icons.arrow_back, color: Colors.black),
                onTap: () {
                  Navigator.of(context);
                },
              ),
              title: Text(
                'Booking Confirm',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              flexibleSpace: Container(
                margin: EdgeInsets.fromLTRB(20, 70, 20, 10),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 70,
                        height: 70,
                        child: Image.network(
                          widget.document.data()["ava"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.document.data()["nama"],
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17)),
                          Text(
                            widget.document.data()["spesialis"],
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
            ),
            SliverFillRemaining(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  physics: (MediaQuery.of(context).orientation ==
                          Orientation.portrait)
                      ? AlwaysScrollableScrollPhysics()
                      : NeverScrollableScrollPhysics(),
                  shrinkWrap: false,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 25),
                      child: Text('Booking Detail',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue[700],
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      color: Colors.grey[200],
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Booking Untuk',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return GantiPasien();
                                      }));
                                    },
                                    child: Text('Ganti Pasien',
                                        style: TextStyle(
                                            color: Colors.blue[700],
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  )
                                ]),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('Nama : ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Poppins')),
                                  Text('')
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Jenis Kelamin : ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins')),
                              Text('')
                            ],
                          ),
                          Row(
                            children: [
                              Text('Status : ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins')),
                              Text('')
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Booking Tanggal",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text(
                                    dateFormate,
                                    style: TextStyle(
                                        color: Colors.red[400],
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await showDatePicker(
                                            context: context,
                                            initialDate: _dateTime == null
                                                ? DateTime.now()
                                                : _dateTime,
                                            firstDate: DateTime(2001),
                                            lastDate: DateTime(2021))
                                        .then((value) {
                                      final String formatted =
                                          formatter.format(value);

                                      dateFormate = formatted.toString();
                                    });
                                  },
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: Colors.blue[700],
                                  ),
                                )
                              ],
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.all(25),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2)),
                          hintText: 'pesan',
                        ),
                        controller: _controllerPesan,
                      ),
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.fromLTRB(25, 0, 25, 10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          splashColor: Colors.blue[900],
                          onTap: () {
                            DBBooking.createOrDeleteDate(
                              date: dateFormate,
                              pesan: _controllerPesan.text,
                              dokter: widget.document['nama'],
                              spesialis: widget.document['spesialis'],
                              // lk: widget.document['laki-laki'],
                              // status: widget.document['status'],
                              // nama: widget.document['nama'],
                              ava: widget.document['ava'],
                              bookingTime: 'Baru Saja',
                            );

                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return SuccessBooking();
                            }));
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: Text(
                              "Konfirmasi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
