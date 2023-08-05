import 'package:flutter/material.dart';
import 'package:test1/view/components/paragraph_text.dart';

import 'heading_text.dart';


class CardHeader extends StatelessWidget {
  String titleText;
  Function navigateToList;
  bool isVisible;
  CardHeader(
      {super.key,
      required this.titleText,
      required this.navigateToList,
      required this.isVisible});

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.amber,
      width: screenwidth * 0.90,
      height: screenhight * 0.04,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          H1text(
            fonttext: "  " + titleText,
            size: screenwidth * 0.044,
            weight: FontWeight.w700,
          ),
          Visibility(
            visible: isVisible,
            child: InkWell(
              onTap: () {
                navigateToList();
              },
              child: Ptext(
                fonttext: "See more >  ",
                size: screenwidth * 0.03,
                weight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
