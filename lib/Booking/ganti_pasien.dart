import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Database/db.dart';

class GantiPasien extends StatefulWidget {
  @override
  _GantiPasienState createState() => _GantiPasienState();
}

class _GantiPasienState extends State<GantiPasien> {
  GlobalKey<FormState> _keyNama = GlobalKey<FormState>();
  final TextEditingController _controllerNama = TextEditingController();

  bool _checkedLK = false;
  bool _checkedPr = false;
  int selectedVal = 0;

  setValue(int val) {
    setState(() {
      selectedVal = val;
    });
  }

  String _statusValue;
  List _statusList = ['Saya Sendiri', 'Anak'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text('Booking Detail',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Pasien').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                return (!snapshot.hasData)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
                        shrinkWrap: true,
                        children: snapshot.data.docs.map((document) {
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          }
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Nama : ',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Poppins')),
                                            Text(document.data()['nama'])
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Jenis Kelamin : ',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Poppins')),
                                            Text(
                                                (document.data()['laki-laki'] ==
                                                        true)
                                                    ? 'Laki-Laki'
                                                    : 'Perempuan')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Status : ',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Poppins')),
                                            Text(document.data()['status'])
                                          ],
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Radio(
                                          value: 1,
                                          groupValue: selectedVal,
                                          onChanged: (value) {
                                            setState(() {
                                              setValue(value);
                                            });
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1.5,
                              ),
                            ],
                          );
                        }).toList());
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _showBottomSheet();
                  },
                  child: Text('Tambah Baru',
                      style: TextStyle(
                          color: Colors.blue[700], fontFamily: 'Poppins')),
                ),
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
          return Container(
              color: Color(0xFF737373),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: bottomNav(context)));
        });
  }

  Column bottomNav(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Divider(
          thickness: 5,
          indent: 150,
          endIndent: 150,
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            'Tambah Info Pasien Baru',
            style: TextStyle(
                color: Colors.blue[700], fontFamily: 'Poppins', fontSize: 20),
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
        CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'Perempuan',
              style: TextStyle(
                  fontSize: 15, fontFamily: 'Poppins', color: Colors.grey),
            ),
            value: _checkedPr,
            onChanged: (value) {
              setState(() {
                _checkedPr = value;
              });
            }),
        SizedBox(
          height: 2,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 160,
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
            Container(
              width: 160,
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
                  onTap: () async {
                    await DBService.createOrDeleteUser('1',
                        lk: _checkedLK,
                        pr: _checkedPr,
                        name: _controllerNama.text,
                        status: _statusValue);
                    Navigator.pop(context);
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
      ],
    );
  }
}
