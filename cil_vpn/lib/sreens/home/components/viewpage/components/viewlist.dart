import 'package:cil_vpn/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:async';
import '../../../../../models/viewList.dart';

class ViewList extends StatefulWidget {
  const ViewList({super.key});

  @override
  State<ViewList> createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {
  bool _isLoadding = true;
  bool _fectching = true;

  List<Widget> widgets = [];

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Animate(
      child: Container(
          margin: EdgeInsets.all(kDefaultPadding),
          height: 500,
          child: ListView(
            controller: scrollController,
            children: _isLoadding ? BuildShimmerListItem() : BuildList(),
          )),
    ).fadeIn();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print("call");
      _fetchData();
    } else {}
  }

  void _fetchData() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        _fectching = true;
      });
    });
    setState(() {
      // widgets.clear();
      if (_fectching) {
        for (int i = 0; i < viewList.length; i++) {
          widgets.add(BuildListItem(i));
        }
        _isLoadding = false;
        _fectching = false;
        print(widgets);
      }
    });
  }

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
  }

  List<Widget> BuildShimmerListItem() {
    Widget widgetItem = Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          // height: 75,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.black, width: 1, style: BorderStyle.solid)),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(300),
                        color: kShadowShimmerColor),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 50,
                    height: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(300),
                        color: kShadowShimmerColor),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 8),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 7),
                      width: 100,
                      height: 15,
                      decoration: BoxDecoration(
                          color: kShadowShimmerColor,
                          borderRadius: BorderRadius.circular(300)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 4),
                      height: 10,
                      decoration: BoxDecoration(
                          color: kShadowShimmerColor,
                          borderRadius: BorderRadius.circular(300)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 4),
                      height: 10,
                      decoration: BoxDecoration(
                          color: kShadowShimmerColor,
                          borderRadius: BorderRadius.circular(300)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      width: 100,
                      height: 8,
                      decoration: BoxDecoration(
                          color: kShadowShimmerColor,
                          borderRadius: BorderRadius.circular(300)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    List<Widget> shimmerList = [];
    for (int i = 0; i < 10; i++) {
      shimmerList.add(Animate(
        child: widgetItem,
        onPlay: (controller) => controller.repeat(),
      ).shimmer(duration: 800.ms, color: Colors.blue));
    }

    return shimmerList;
  }

  AnimateList<Widget> BuildList() {
    return AnimateList(
      interval: 400.ms,
      effects: [
        FadeEffect(duration: 300.ms),
        MoveEffect(
            duration: 500.ms,
            begin: const Offset(-16, 0),
            curve: Curves.easeOutQuad),
        ShimmerEffect(delay: 300.ms, color: Colors.white70)
      ],
      children: widgets,
    );
  }

  Widget BuildListItem(int index) {
    Widget widget = Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          // height: 75,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.black, width: 1, style: BorderStyle.solid)),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        boxShadow: [kDefaultShadow],
                        borderRadius: BorderRadius.circular(300),
                        image: DecorationImage(
                            image: NetworkImage(viewList[index][2]),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    viewList[index][1],
                    style: kDefaultTextStyle,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 8),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewList[index][0],
                      style: kDefaultTextStyle,
                    ),
                    Text(
                      "\t  ${viewList[index][3]}",
                      textAlign: TextAlign.left,
                      style: kDefaultArticleStyle,
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      viewList[index][4],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return widget;
  }
}
