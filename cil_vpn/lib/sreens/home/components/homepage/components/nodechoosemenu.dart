import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../models/constants.dart';

class NodeChooseMenu extends StatefulWidget {
  const NodeChooseMenu({super.key});

  @override
  State<NodeChooseMenu> createState() => _NodeChooseMenuState();
}

class _NodeChooseMenuState extends State<NodeChooseMenu> {
  String node = "China";
  List<List<String>> NodeList = [
    ["China", "80"],
    ["Japen", "80"],
    ["American", "80"],
    ["American", "80"],
    ["American", "80"],
    ["American", "80"],
    ["American", "80"],
    ["American", "80"],
  ];
  @override
  Widget build(BuildContext context) {
    Widget widget = Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context, builder: (context) => BottomDialog());
        },
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding / 2),
          decoration: BoxDecoration(
              border: Border.all(color: kSecondaryColor, width: 4),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            "${node} Node",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
    return Animate(
      child: widget,
    ).animate().fadeIn(delay: 400.ms, duration: 1800.ms);
  }

  Widget BottomDialog() {
    return Container(
        child: ListView.builder(
      itemCount: NodeList.length,
      itemBuilder: (context, index) => BuildNodeItem(index),
    ));
  }

  Widget BuildNodeItem(int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            node = NodeList[index][0];
            Navigator.pop(context);
          });
        },
        child: Container(
          decoration:
              BoxDecoration(color: Colors.white, boxShadow: [kDefaultShadow]),
          height: 40,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  NodeList[index][0],
                  style: kDefaultTextStyle,
                ),
                Row(
                  children: [
                    Text(
                      "ping  ${NodeList[index][1]}",
                      style: kDefaultTextStyle,
                    ),
                    Icon(1 == 1 ? Icons.wifi : Icons.wifi_1_bar)
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
