import 'package:eudeka_comp/Home/Tentang%20Kami/detail_tentang_kami.dart';
import 'package:eudeka_comp/Partner%20&%20Career/partner_career.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Histori Booking/histori_booking.dart';
import 'Notifikasi/notifikasi.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Widget> tab = [
    Text("Notifikasi",
        style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
    Text("Histori Booking",
        style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold))
  ];

  List<String> stringTab = ['Notifikasi', 'Histori Booking'];
  PageController pageController = PageController();
  int _currentPage = 0;

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  TabBar tabBar = TabBar(
      indicator: BoxDecoration(
        color: Colors.green,
        border: Border(
          bottom: BorderSide(color: Colors.white, width: 5),
        ),
      ),
      tabs: [
        Tab(
          text: 'Notification',
        ),
        Tab(
          text: "History",
        )
      ]);

  String onClick;
  List<String> logout = ['Logout'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        floatingActionButton: SpeedDial(
          child: Icon(Icons.settings),
          overlayOpacity: 0.5,
          overlayColor: Colors.black,
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
              child: Icon(Icons.logout),
              label: 'Logout',
            ),
            SpeedDialChild(
                child: Icon(Icons.favorite_outline),
                label: 'Feedback',
                onTap: () async => await openUrl(
                    'https://docs.google.com/forms/d/e/1FAIpQLSc_-LVjNrvbrAM-DBUKSt54iq0GF9XLPhK6INsxk0quftYDpw/viewform',
                    enableJavaScript: true,
                    forceWebView: true)),
            SpeedDialChild(
                child: Icon(
                  Icons.work_outline,
                ),
                label: 'Partner & Career',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PartnerCareer()))),
            SpeedDialChild(
                child: Icon(Icons.info_outline),
                label: 'Tentang Kami',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailTK())))
          ],
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.blue,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ))),
            Positioned(
              top: 150,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top: 70),
                        child: Text(
                          'Ahya Satari',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text('Laki - Laki',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 15)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            '0895351577557',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          )),
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.all(2),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List<Widget>.generate(2, (int index) {
                              return GestureDetector(
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  width:
                                      MediaQuery.of(context).size.width / 2.29,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: (index == _currentPage)
                                        ? Colors.white
                                        : Colors.grey[300],
                                  ),
                                  child: Center(
                                      child: Text(stringTab[index],
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold))),
                                ),
                              );
                            })),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: PageView(
                            controller: pageController,
                            onPageChanged: _onChanged,
                            children: [
                              Notifikasi(),
                              HistoriBooking(),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 100),
                // left: (MediaQuery.of(context).orientation == Orientation.portrait)
                //     ? 140
                //     : 320,
                // right:
                //     (MediaQuery.of(context).orientation == Orientation.portrait)
                //         ? 140
                //         : 320,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                        width: (MediaQuery.of(context).orientation ==
                                Orientation.portrait)
                            ? 110
                            : MediaQuery.of(context).size.width / 5,
                        height: 110,
                        child: Image.asset(
                          'images/hospital.jpg',
                          fit: BoxFit.cover,
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openUrl(String url,
      {bool forceWebView = false, bool enableJavaScript = false}) async {
    await launch(url,
        forceWebView: forceWebView, enableJavaScript: enableJavaScript);
  }
}
