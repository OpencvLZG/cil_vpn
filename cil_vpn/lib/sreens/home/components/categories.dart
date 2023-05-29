import 'package:cil_vpn/sreens/home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../models/constants.dart';

class Categories extends StatefulWidget {
  final Function refreshPage;

  Categories({required this.refreshPage});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedCategory = 0;

  List<String> categories = ["Home", "View", "Self"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(context, index)),
    );
  }

  Animate buildCategory(context, index) {
    Padding padding = Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
            widget.refreshPage(index);
          });
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            categories[index],
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: index == selectedCategory
                      ? kTextColor
                      : Colors.black.withOpacity(0.4),
                ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 6,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: index == selectedCategory
                  ? kSecondaryColor
                  : Colors.transparent,
            ),
          )
        ]),
      ),
    );
    return Animate(child: padding).animate().fadeIn(
          duration: 2000.ms,
        );
  }
}
