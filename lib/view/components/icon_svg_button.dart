import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/constants/assets.dart';

class IconSvgButton extends StatelessWidget {
  Function crowselclick;
  var height;
  var width;
  String iconimage;
  dynamic iconImageColor;

  IconSvgButton(
      {super.key,
      required this.crowselclick,
      required this.iconImageColor,
      required this.height,
      required this.width,
      required this.iconimage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => crowselclick(),
      child: Container(
        width: width * 0.07,
        height: height * 0.04,
        decoration: BoxDecoration(
            // color: Color.fromARGB(60, 210, 108, 108),
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconimage,
                width: width * 0.050,
                // color: Colors.amber,
                colorFilter: ColorFilter.mode(iconImageColor, BlendMode.srcIn),
                height: height * 0.026,
                semanticsLabel: 'Cart'),
          ],
        ),
      ),
    );
  }
}
