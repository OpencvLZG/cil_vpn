import 'package:cil_vpn/sreens/home/components/body.dart';
import 'package:flutter/material.dart';

import '../../../../../models/constants.dart';

class ViewCategories extends StatefulWidget {
  const ViewCategories({super.key});

  @override
  State<ViewCategories> createState() => _ViewCategoriesState();
}

class _ViewCategoriesState extends State<ViewCategories> {
  int selectedCategory = 0;

  List<String> categories = [
    "Life",
    "Game",
    "Music",
    "Ai",
    "Web",
    "Golang",
    "Java",
    "PHP"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(context, index)),
    );
  }

  Padding buildCategory(context, index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
            // widget.refreshPage(index);
          });
        },
        child: Container(
          alignment: Alignment.center,
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                categories[index],
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: index == selectedCategory
                        ? kTextColor
                        : Colors.black.withOpacity(0.4),
                    decorationColor: Colors.red),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
