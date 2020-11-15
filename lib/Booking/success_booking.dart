import 'package:eudeka_comp/Booking/booking.dart';
import 'package:eudeka_comp/Booking/detail_booking.dart';
import 'package:eudeka_comp/Profile/profile.dart';
import 'package:flutter/material.dart';

class SuccessBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 150,
            ),
            Text(
              'Booking Sukses!',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, bottom: 5),
              child: Text(
                'Kode booking anda',
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 10, color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 15),
              child: Text(
                'U271J2X',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.6,
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                'Custumer Service kami akan menghubungi anda untuk konfirmasi selanjutnya',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 10, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: 60,
              margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  splashColor: Colors.blue[900],
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Profile();
                    }));
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Text(
                      "Lihat Histori",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Booking();
                }));
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Tidak, kembali ke home',
                  style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Poppins',
                      fontSize: 10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
