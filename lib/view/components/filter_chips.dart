import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FilterChips extends StatefulWidget {
  FilterChips({super.key});

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  List catogary = ["mobile", "cloath", "househlod"];

  bool favorite = false;

  final List<String> _filters = <String>[];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: catogary.map((catogary) {
        return FilterChip(
          label: Text(catogary),
          selected: _filters.contains(catogary),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                if (!_filters.contains(catogary)) {
                  _filters.add(catogary);
                }
              } else {
                _filters.removeWhere((String name) {
                  return name == catogary;
                });
              }
            });
          },
        );
      }).toList(),
    );
  }
}
