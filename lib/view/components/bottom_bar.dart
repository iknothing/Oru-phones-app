import 'package:flutter/material.dart';
import 'package:test1/view/components/icon_svg_button.dart';
import 'package:test1/view/components/paragraph_text.dart';

import '../../utils/constants/assets.dart';


class BottomBar extends StatelessWidget {
  Function screen;
  Color backgroundColor;
  Color iconColor;

  BottomBar({
    super.key,
    required this.screen,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      height: screenhight * 0.07,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconSvgButton(
                  crowselclick: () {
                    screen(0);
                  },
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.home, iconImageColor: iconColor,),
              Ptext(
                fonttext: "Home",
                size: screenwidth * 0.028,
                weight: FontWeight.w300,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconSvgButton(
                  crowselclick: () {
                    // screen(1);
                  },
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.list, iconImageColor: iconColor,),
              Ptext(
                fonttext: "My Listings",
                size: screenwidth * 0.028,
                weight: FontWeight.w300,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconSvgButton(
                  crowselclick: () {
                    // screen(2);
                  },
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.brandWatermark, iconImageColor: iconColor,),
              Ptext(
                fonttext: "sell  Now",
                size: screenwidth * 0.028,
                weight: FontWeight.w300,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconSvgButton(
                  crowselclick: () {
                    // screen(3);
                  },
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.favorite, iconImageColor: iconColor,),
              Ptext(
                fonttext: "favorite",
                size: screenwidth * 0.028,
                weight: FontWeight.w300,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconSvgButton(
                  crowselclick: () {
                    // screen(4);
                  },
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.profile, iconImageColor: iconColor,),
              Ptext(
                fonttext: "Account",
                size: screenwidth * 0.028,
                weight: FontWeight.w300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
