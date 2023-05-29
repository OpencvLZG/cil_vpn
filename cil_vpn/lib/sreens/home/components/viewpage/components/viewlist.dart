import 'package:cil_vpn/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ViewList extends StatefulWidget {
  const ViewList({super.key});

  @override
  State<ViewList> createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {
  List<List<String>> viewList = [
    [
      "Title",
      "Cilang",
      "http://q2.qlogo.cn/headimg_dl?dst_uin=1019383856&spec=100",
      "contextcontextcontextcontextcontextcontextcontextcontextcontextcontextcontextcontextcontextcontextcontext",
      "time"
    ],
    [
      "Title",
      "name",
      "http://q2.qlogo.cn/headimg_dl?dst_uin=1019383856&spec=100",
      "context",
      "time"
    ],
    [
      "Title",
      "name",
      "http://q2.qlogo.cn/headimg_dl?dst_uin=1019383856&spec=100",
      "context",
      "time"
    ]
  ];
  @override
  Widget build(BuildContext context) {
    ListView listView = ListView.builder(
      itemCount: viewList.length,
      itemBuilder: (context, index) => BuildListItem(index),
    );
    return Animate(
      child: Container(
          margin: EdgeInsets.all(kDefaultPadding),
          height: 500,
          child: listView),
    ).fadeIn();
  }

  Widget BuildListItem(int index) {
    return Padding(
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
                  )
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
  }
}
