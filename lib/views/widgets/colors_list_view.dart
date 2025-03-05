import 'package:flutter/material.dart';

import 'color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color> colors = [
    Color(0xFFf4e285),
    Color(0xFFf4a259),
    Color(0xFF5b8e7d),
    Color(0xFFbc4b51),
    Color(0xFF8cb369),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ColorItem(
                color: colors[index],
                isActive: currentIndex == index,
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                },
              ),
            );
          }),
    );
  }
}
