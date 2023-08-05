import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/colorpallets.dart';

class CommonButton extends StatelessWidget {
  double width;
  double height;
  String btnTitle;
  Color btnColor;
  Function onTapHandler;
  CommonButton({
    super.key,
    required this.width,
    required this.height,
    required this.btnTitle,
    required this.btnColor,
    required this.onTapHandler,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        onTapHandler();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: btnColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnTitle,
              style: GoogleFonts.poppins(
                  color: TheamColors.backgroundColor,
                  fontSize: screenwidth * 0.034,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
