import 'package:flutter/material.dart';
import 'package:test1/utils/routes/routes_name.dart';
import 'package:test1/view/screens/main_screen.dart';

import '../../view/screens/search_screen.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
   

      case RoutesName.home:
        return MaterialPageRoute(builder: (buildContext) => MainScreen());

      // case RoutesName.noInternet:
      //   return MaterialPageRoute(builder: (buildContext) => NoInternet());

      case RoutesName.searchScreen:
        return MaterialPageRoute(builder: (buildContext) => SearchScreen());


      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("Default")),
          );
        });
    }
  }
}
