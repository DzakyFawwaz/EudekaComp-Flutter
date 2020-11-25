import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eudeka_comp/Database/db.dart';
import 'package:flutter/material.dart';

import 'booking_confirm.dart';

class DetailBooking extends StatefulWidget {
  final DocumentSnapshot document;

  DetailBooking(this.document);

  @override
  _DetailBookingState createState() => _DetailBookingState();
}

class _DetailBookingState extends State<DetailBooking> {
  GlobalKey<FormState> _keyHP = GlobalKey<FormState>();
  GlobalKey<FormState> _keyEmail = GlobalKey<FormState>();
  GlobalKey<FormState> _keyNama = GlobalKey<FormState>();

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerNoHandphone = TextEditingController();
  final TextEditingController _controllerNama = TextEditingController();

  bool _checkedLK = false;
  bool _checkedPr = false;

  String _statusValue;
  List _statusList = ['Saya Sendiri', 'Anak'];

  navigateToDetail(DocumentSnapshot document) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BookingConfirm(document)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                expandedHeight: 200.0,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    widget.document.data()['ava'],
                    fit: BoxFit.cover,
                  ),
                )),
            SliverFillRemaining(
              child: Container(
                margin: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: false,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          widget.document.data()['nama'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        widget.document.data()['spesialis'],
                        style: TextStyle(color: Colors.grey),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text(
                          'Jadwal',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text(
                          'Biografi',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          child: Text(widget.document.data()['bio'],
                              style: TextStyle(color: Colors.grey))),
                      Text(
                        'Kredensial',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          child: Text(widget.document.data()['kredensial'],
                              style: TextStyle(color: Colors.grey))),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Afliansi Akademik',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(widget.document.data()['akademis'],
                          style: TextStyle(color: Colors.grey)),
                    ]),
              ),
            ),
            SliverAppBar(
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              flexibleSpace: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                        child: Text(
                          "Buat Janji",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          _showBottomSheet();
                        })),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Flexible(
            child: Container(
                color: Color(0xFF737373),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                child: Container(
                    // padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Flexible(child: bottomNav(context)))),
          );
        });
  }

  Container bottomNav(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(shrinkWrap: false, children: [
        Divider(
          thickness: 5,
          indent: 150,
          endIndent: 150,
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            'Maaf, anda belum terdaftar dalam aplikasi. Harap daftar terlebih dahulu untuk dapat membooking jadwal dengan dokter yang bersangkutan.',
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _keyNama,
            child: TextFormField(
              controller: _controllerNama,
              validator: (value) {
                if (value.isEmpty) {
                  return 'This field must not be blank';
                }
                return null;
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 2)),
                labelText: 'Nama',
                labelStyle: TextStyle(
                    color: Colors.black38, fontFamily: 'Poppins', fontSize: 15),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text('Jenis Kelamin',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.grey)),
        ),
        CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  'Laki - Laki',
                  style: TextStyle(
                      fontSize: 15, fontFamily: 'Poppins', color: Colors.grey),
                ),
                value: _checkedLK,
                onChanged: (value) {
                  setState(() {
                    _checkedLK = value;
                  });
                }),
            Expanded(
              child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'Perempuan',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: Colors.grey),
                  ),
                  value: _checkedPr,
                  onChanged: (value) {
                    setState(() {
                      _checkedPr = value;
                    });
                  }),
            ),
        SizedBox(
          height: 2,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 10),
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _keyHP,
            child: TextFormField(
              controller: _controllerNoHandphone,
              validator: (value) {
                if (value.isEmpty) {
                  return 'This field must not be blank';
                }
                return null;
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 2)),
                labelText: 'No Handphone',
                labelStyle: TextStyle(
                    color: Colors.black38, fontFamily: 'Poppins', fontSize: 15),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _keyEmail,
            child: TextFormField(
              controller: _controllerEmail,
              validator: (value) {
                if (value.isEmpty) {
                  return 'This field must not be blank';
                }
                return null;
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                labelText: 'Email',
                labelStyle: TextStyle(
                    color: Colors.black38, fontFamily: 'Poppins', fontSize: 15),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(10),
          child: DropdownButton(
              value: _statusValue,
              hint: Text('Status',
                  style: TextStyle(fontFamily: 'Poppins', color: Colors.grey)),
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 40,
              items: _statusList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(color: Colors.black)),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _statusValue = value;
                });
              }),
        ),
        Row(
          mainAxisAlignment:
              (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  splashColor: Colors.grey,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Text(
                      "Batal",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              width: 150,
              height: 50,
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
                    DBService.createOrDeleteUser('1',
                        lk: _checkedLK,
                        pr: _checkedPr,
                        name: _controllerNama.text,
                        email: _controllerEmail.text,
                        noHp: _controllerNoHandphone.text,
                        status: _statusValue,
                        dokter: widget.document.data()['nama'],
                        dokterAva: widget.document.data()['ava'],
                        dokterSpesialis: widget.document.data()['spesialis']);

                    navigateToDetail(widget.document);
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
