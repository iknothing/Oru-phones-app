import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CoustomRangeSlider extends StatefulWidget {
  Function Rangevalue;

  CoustomRangeSlider({super.key, required this.Rangevalue});

  @override
  State<CoustomRangeSlider> createState() => _CoustomRangeSliderState();
}

class _CoustomRangeSliderState extends State<CoustomRangeSlider> {
  // double start = 30.0;
  // double end = 50.0;
  var _currentRangeValues = const RangeValues(10000.0, 80000.0);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: 1000.0,
      max: 100000.0,
      divisions: 20,
      values: _currentRangeValues,
      labels: RangeLabels(_currentRangeValues.start.toString(),
          _currentRangeValues.end.toString()),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
          widget.Rangevalue(_currentRangeValues);
          print(values);
        });
      },
    );
  }
}
