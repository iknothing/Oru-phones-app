import 'package:flutter/material.dart';
import 'package:test1/view/components/heading_text.dart';
import '../../utils/constants/colorpallets.dart';

class IncrementDecrementButton extends StatefulWidget {
  Function quantityValue;
  int initialQuantity;
  IncrementDecrementButton(
      {super.key, required this.quantityValue, required this.initialQuantity});

  @override
  State<IncrementDecrementButton> createState() =>
      _IncrementDecrementButtonState();
}

class _IncrementDecrementButtonState extends State<IncrementDecrementButton> {
  ValueNotifier<int> incDecValue = ValueNotifier(1);

  @override
  void initState() {
    incDecValue.value = widget.initialQuantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              decrement() {
                if (incDecValue.value <= 1) {
                  incDecValue.value = 1;
                } else {
                  incDecValue.value = incDecValue.value - 1;
                }
              }

              decrement();
              widget.quantityValue(incDecValue.value.toInt());
            },
            child: Container(
                width: screenwidth * 0.07,
                height: screenwidth * 0.07,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: TheamColors.primaryColor,
                ),
                child: Icon(
                  Icons.remove,
                  color: TheamColors.backgroundColor,
                  size: screenwidth * 0.03,
                )),
          ),
          Container(
            width: screenwidth * 0.06,
            height: screenhight * 0.028,
            alignment: Alignment.center,
            child: ValueListenableBuilder(
              builder: (BuildContext context, value, Widget? child) {
                return H1text(
                  fonttext: incDecValue.value.toString(),
                  size: screenwidth * 0.032,
                  weight: FontWeight.w500,
                );
              },
              valueListenable: incDecValue,
            ),
          ),
          InkWell(
            onTap: ()async {
              increment() {
                incDecValue.value = incDecValue.value + 1;
              }

             increment();
             await widget.quantityValue(incDecValue.value.toInt());
            },
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: TheamColors.primaryColor,
                ),
                width: screenwidth * 0.07,
                height: screenwidth * 0.07,
                child: Icon(
                  Icons.add,
                  color: TheamColors.backgroundColor,
                  size: screenwidth * 0.03,
                )),
          )
        ],
      ),
    );
  }
}
