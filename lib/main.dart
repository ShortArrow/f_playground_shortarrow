// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(
      // text: '会社概要', //ホーム 会社概要 検査ツール事業 デジタル事業 品質保証事業 リクルート
      child: Text("会社概要",
          style: GoogleFonts.notoSans(), textAlign: TextAlign.center),
    ),
    Tab(
      // text: "検査ツール\n事業",
      child: Text("検査ツール\n事業",
          style: GoogleFonts.notoSans(), textAlign: TextAlign.center),
    ),
    Tab(
      // text: "デジタル\n事業",
      child: Text("デジタル\n事業",
          style: GoogleFonts.notoSans(), textAlign: TextAlign.center),
    ),
    Tab(
      // text: "品質保証\n事業",
      child: Text("品質保証\n事業",
          style: GoogleFonts.notoSans(), textAlign: TextAlign.center),
    )
  ];
  TabController _tabController;

  @override
  void initState() {
    // ToODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 30,
          width: 100,
          child: SvgPicture.asset(
            'assets/svg/GFLogoColor.svg',
            fit: BoxFit.contain,
            semanticsLabel: 'gflogo',
          ),
        ),
        bottom: TabBar(
//          isScrollable: true,
          tabs: tabs,
          controller: _tabController,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.green,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2,
          // indicatorPadding:
          //     EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          labelColor: Colors.green,
        ),
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage('assets/img/back_top.jpg'),
        //           fit: BoxFit.cover)),
        // ),
      ),
      //Todo
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((tab) {
          return _createTab(tab);
        }).toList(),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'GREENFIX CO.,LTD.',
                style: GoogleFonts.notoSans(
                    textStyle: TextStyle(color: Colors.white)),
              ),
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('assets/img/back_sidebar.jpg'),
              //         fit: BoxFit.cover)),
            ),
            ListTile(
              title: Text("会社概要",
                  style: GoogleFonts.notoSans(
                    textStyle: TextStyle(fontSize: 16),
                  )),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("検査具事業",
                  style: GoogleFonts.notoSans(
                    textStyle: TextStyle(fontSize: 16),
                  )),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createTab(Tab tab) {
    return Center(
      child: Text(
        tab.child.toStringDeep(),
        style: GoogleFonts.notoSans(
          textStyle: TextStyle(fontSize: 24),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class SpaceBox extends SizedBox {
  SpaceBox({double width = 8, double height = 8})
      : super(width: width, height: height);

  SpaceBox.width([double value = 8]) : super(width: value);
  SpaceBox.height([double value = 8]) : super(height: value);
}
