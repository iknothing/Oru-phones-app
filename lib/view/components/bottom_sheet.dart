import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/view/components/card_header.dart';
import 'package:test1/view/components/choice_chips.dart';
import 'package:test1/view/components/custom_button.dart';
import 'package:test1/view/components/custom_redio.dart';
import 'package:test1/view/components/randge_slider.dart';
import '../../controllers/filter_controller.dart';
import '../../utils/constants/colorpallets.dart';
import 'heading_text.dart';

showCoustomBottomSheet(
    context, screenwidth, screenhight, condition, make, ram, storage) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: screenhight * 0.90,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CardHeader(
                titleText: "Price",
                navigateToList: () {},
                isVisible: false,
              ),
              Container(
                  height: screenhight * 0.070,
                  width: screenwidth,
                  color: Color.fromARGB(59, 227, 221, 221),
                  child: ChoiceChipCatogary(
                    data: ram,
                    bgColor: TheamColors.backgroundColor,
                    selectColor: TheamColors.backgroundColor,
                    textColor: TheamColors.PtexrtColor1,
                    isVisible: false,
                    ChoiceChip: (choiceValue) {},
                    chipType: 'Filter',
                  )),
              Container(
                  height: screenhight * 0.070,
                  width: screenwidth,
                  color: Color.fromARGB(59, 227, 221, 221),
                  child: ChoiceChipCatogary(
                    data: condition,
                    bgColor: TheamColors.backgroundColor,
                    selectColor: TheamColors.backgroundColor,
                    textColor: TheamColors.PtexrtColor1,
                    isVisible: false,
                    ChoiceChip: (choiceValue) {},
                    chipType: 'Filter',
                  )),
              Container(
                  height: screenhight * 0.070,
                  width: screenwidth,
                  color: Color.fromARGB(59, 227, 221, 221),
                  child: ChoiceChipCatogary(
                    data: make,
                    bgColor: TheamColors.backgroundColor,
                    selectColor: TheamColors.backgroundColor,
                    textColor: TheamColors.PtexrtColor1,
                    isVisible: false,
                    ChoiceChip: (choiceValue) {},
                    chipType: 'Filter',
                  )),
              Container(
                  height: screenhight * 0.070,
                  width: screenwidth,
                  color: Color.fromARGB(59, 227, 221, 221),
                  child: ChoiceChipCatogary(
                    data: storage,
                    bgColor: TheamColors.backgroundColor,
                    selectColor: TheamColors.backgroundColor,
                    textColor: TheamColors.PtexrtColor1,
                    isVisible: false,
                    ChoiceChip: (choiceValue) {},
                    chipType: 'Filter',
                  )),
              SizedBox(
                height: screenhight * 0.04,
              ),
              CommonButton(
                  width: screenwidth,
                  height: screenhight * 0.056,
                  btnTitle: "ApplyFilter",
                  btnColor: TheamColors.primaryColor,
                  onTapHandler: () {
                    // filterProductsController(QuerryFilter);
                  })
            ],
          ),
        ),
      );
    },
  );
}
