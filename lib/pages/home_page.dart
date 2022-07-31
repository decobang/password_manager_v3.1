import 'dart:html';

import 'package:flutter/material.dart';
import 'package:password_manager_v3/adaptive_layouts/mobile_layout/moblie_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    if (size.width < 600) {
      return MobileHomePage(context);
    } else if (size.width > 600 && size.width < 1024) {
      print("Tablet Size");
      return Center(
        child: Text("Tablet Size"),
      );
    } else {
      print("Desktop Size");
      return Center(
        child: Text("Desktop Size"),
      );
    }
  }
}
