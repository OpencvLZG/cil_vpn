import 'package:cil_vpn/models/constants.dart';
import 'package:cil_vpn/sreens/home/components/categories.dart';
import 'package:cil_vpn/sreens/home/components/viewpage/components/viewcategoried.dart';
import 'package:cil_vpn/sreens/home/components/viewpage/components/viewlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  void refreshView() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = Column(
      children: [ViewCategories(), ViewList()],
    );
    return Animate(
      child: widget,
    ).fadeIn();
  }
}
