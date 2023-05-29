import 'package:cil_vpn/models/constants.dart';
import 'package:cil_vpn/sreens/home/components/categories.dart';
import 'package:cil_vpn/sreens/home/components/homepage/components/connectbtn.dart';
import 'package:cil_vpn/sreens/home/components/homepage/components/nodechoosemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget wiedget = Column(
      children: [NodeChooseMenu(), ConnectBtn()],
    );
    return Animate(
      child: wiedget,
    ).animate().fadeIn().slide();
  }
}
