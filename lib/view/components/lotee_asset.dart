import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class ltAsset extends StatelessWidget {
  String assetLink;
   ltAsset({super.key, required this.assetLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Lottie.asset(
            assetLink,
            fit: BoxFit.fill,
          )),
    );
  }
}
