import 'package:cil_vpn/sreens/home/components/homepage/homepage.dart';
import 'package:cil_vpn/sreens/home/components/selfpage/selfpage.dart';
import 'package:cil_vpn/sreens/home/components/viewpage/viewpage.dart';
import 'package:flutter/material.dart';

import '../../../models/constants.dart';
import 'categories.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currrentIndex = 0;
  List<Widget> pageList = [HomePage(), ViewPage(), SelfPage()];
  void refreshPage(int index) {
    setState(() {
      // print(index);
      currrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Categories(
          refreshPage: refreshPage,
        ),
        pageList[currrentIndex]
      ]),
    );
  }
}
