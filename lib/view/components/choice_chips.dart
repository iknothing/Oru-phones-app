
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/colorpallets.dart';

class ChoiceChipCatogary extends StatefulWidget {
  List data = [];
  Color bgColor;
  Color selectColor;
  Color textColor;
  bool isVisible;
  Function ChoiceChip;
  String chipType;

  ChoiceChipCatogary({
    super.key,
    required this.chipType,
    required this.data,
    required this.bgColor,
    required this.selectColor,
    required this.textColor,
    required this.isVisible,
    required this.ChoiceChip,
  });

  @override
  State<ChoiceChipCatogary> createState() => _ChoiceChipCatogaryState();
}

class _ChoiceChipCatogaryState extends State<ChoiceChipCatogary> {
  // List mylist = dataLists.chipList;

  // dynamic response;
  // List listdata = [];

  int? _value;
  late bool selectedButton = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.fromLTRB(6, 0, 10, 0),
          child: ChoiceChip(
            selectedColor: widget.selectColor,
            backgroundColor: widget.bgColor,
            shape: RoundedRectangleBorder(
                side: _value == index
                    ? BorderSide(
                        color: widget.textColor,
                        width: 2,
                        style: BorderStyle.solid)
                    :  BorderSide(
                        color: TheamColors.backgroundColor,
                        width: 0,
                        style: BorderStyle.solid),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            label: Text(
              '${widget.data[index]}',
              style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: widget.textColor),
            ),
            // avatar: Visibility(
            //   visible: widget.isVisible,
            //   child: Container(
            //     color: Colors.amberAccent,
            //   ),
            // ),
            selected: _value == index,
            onSelected: (bool selected) {
              widget.ChoiceChip(widget.chipType == "Category"
                  ? widget.data[index]
                  : widget.data[index]);
              setState(() {
                _value = selected ? index : null;
                // selectedButton = selected;
              });
            },
          )),
    );
  }
}



            //  Wrap(
            //         spacing: 5.0,
            //         children: List<Widget>.generate(
            //           3,
            //           (int index) {
            //             return ChoiceChip(
            //               label: Text('Item $index'),
            //               selected: _value == index,
            //               onSelected: (bool selected) {
            //                 print(selected);
            //                 setState(() {
            //                   _value = selected ? index : null;
            //                 });
            //                 print(_value);
            //               },
            //             );
            //           },
            //         ).toList())