import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class CoustomRedio extends StatefulWidget {
  double width;
  double height;
  Function getColorValue;
  var pL;
  var pR;
  List data = [];
  Color activeBtn;
  String chipType;

  CoustomRedio(
      {super.key,
      required this.getColorValue,
      required this.width,
      required this.pL,
      required this.pR,
      required this.height,
      required this.chipType,
      required this.data,
      required this.activeBtn});

  @override
  State<CoustomRedio> createState() => _CoustomRedioState();
}

class _CoustomRedioState extends State<CoustomRedio> {
  int? lastIndex;

  @override
  Widget build(BuildContext context) {
    print("coustom built function ran");
    return ListView.builder(
      itemCount: widget.data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(widget.pL, 0, widget.pR, 0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  widget.getColorValue(widget.data[index]);
                  lastIndex = index;
                  setState(() {});
                },
                // onTap: widget.onpressBtn(),
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: lastIndex == index
                        ? Border.all(
                            color: widget.activeBtn,
                            width: 2,
                            style: BorderStyle.solid)
                        : null,
                    borderRadius: BorderRadius.circular(8),
                    color: HexColor(widget.chipType == 'Filter'
                        ? widget.data[index]['Value'].toString()
                        : widget.data[index].toString()),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
