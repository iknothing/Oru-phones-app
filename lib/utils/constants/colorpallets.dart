import 'package:flutter/material.dart';

class TheamColors with ChangeNotifier {
  static Color primaryColor = const Color.fromARGB(221, 255, 255, 255);
  static Color backgroundColor = Color.fromARGB(255, 44, 46, 67);
  static Color unselectedChipColor = Color.fromARGB(255, 0, 0, 0);
  static Color selectedChipColor = Color.fromARGB(221, 255, 255, 255);
  static Color HtexrtColor1 = const Color.fromARGB(221, 38, 38, 38);
  // static const Color PtexrtColor1 = Color.fromARGB(221, 105, 105, 105);
  static Color PtexrtColor1 = Color.fromARGB(221, 255, 255, 255);
  static Color HtexrtColor2 = Color.fromARGB(255, 126, 126, 126);
  static Color PtexrtColor2 = Color.fromARGB(255, 255, 255, 255);

  // static const Color primaryColor = Colors.white70;
  // static const Color backgroundColor = Colors.black87;
  static Color cardColor = const Color.fromARGB(255, 255, 255, 255);

  dynamic theamMode = false;

  SetDarkMode(bool mode) {
    if (mode == true) {
      theamMode = mode;
      primaryColor = const Color.fromARGB(255, 255, 255, 255);
      backgroundColor = Colors.black87;
      unselectedChipColor = const Color.fromARGB(180, 114, 114, 114);
      selectedChipColor = Colors.white;
      HtexrtColor1 = const Color.fromARGB(255, 236, 236, 236);
      HtexrtColor2 = const Color.fromARGB(221, 212, 212, 212);
      PtexrtColor1 = const Color.fromARGB(255, 255, 255, 255);
      PtexrtColor2 = const Color.fromARGB(221, 45, 45, 45);
      cardColor = const Color.fromARGB(221, 45, 45, 45);
    } else {
      theamMode = mode;
      primaryColor = Colors.black87;
      backgroundColor = const Color.fromARGB(255, 255, 255, 255);
      unselectedChipColor = const Color.fromARGB(255, 206, 206, 206);
      selectedChipColor = Colors.black87;
      HtexrtColor1 = const Color.fromARGB(221, 38, 38, 38);
      PtexrtColor1 = const Color.fromARGB(221, 45, 45, 45);
      HtexrtColor2 = const Color.fromARGB(255, 126, 126, 126);
      PtexrtColor2 = const Color.fromARGB(255, 255, 255, 255);
      cardColor = const Color.fromARGB(255, 255, 255, 255);
    }

    notifyListeners();
  }
}
