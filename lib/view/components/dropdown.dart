import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colorpallets.dart';

class DropdownBtn extends StatefulWidget {
  const DropdownBtn({super.key});

  @override
  State<DropdownBtn> createState() => _DropdownBtnState();
}

class _DropdownBtnState extends State<DropdownBtn> {
  var dropdownValue;

  var list = <String>["S", "M", "L", "Xl", "XXl"];

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return DropdownButton<String>(
      value: dropdownValue,
      icon: SvgPicture.asset(AssetImgLinks.filter,
          width: screenwidth * 0.04,
          height: screenhight * 0.018,
          semanticsLabel: 'Cart'),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 0,
        color: TheamColors.backgroundColor,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
