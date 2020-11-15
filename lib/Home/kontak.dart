import 'package:flutter/material.dart';

class Kontak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Kontak & Pengaduan",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5, bottom: 4),
                    child: Text("Rumah Sakit SMKDEV",
                        style: TextStyle(fontWeight: FontWeight.w800)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text("Jl. Margacinta Np. 29",
                        style: TextStyle(color: Colors.grey)),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.email_outlined, color: Colors.grey),
              Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text("info@smk.dev",
                      style: TextStyle(color: Colors.grey)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.phone_outlined,
                    color: Colors.grey,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("+622 7000 0000",
                          style: TextStyle(color: Colors.grey))),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  Icon(Icons.home_work_outlined, color: Colors.grey),
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text("+622 7000 0000",
                          style: TextStyle(color: Colors.grey)))
                ],
              ),
              Spacer(
                flex: 2,
              )
            ],
          )
        ],
      ),
    );
  }
}
