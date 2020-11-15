import 'package:eudeka_comp/Home/temui_kami.dart';
import 'package:eudeka_comp/Home/berita_terbaru.dart';
import 'package:eudeka_comp/Home/kontak.dart';
import 'package:flutter/material.dart';

import 'Tentang Kami/tentang_kami.dart';
import 'carousel.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Carousel(),
          TemuiKami(),
          TentangKami(),
          BeritaTerbaru(),
          Kontak()
        ],
      ),
    );
  }
}
