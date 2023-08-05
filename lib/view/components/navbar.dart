import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:test1/view/components/bottom_sheet.dart';
import 'package:test1/view/components/heading_text.dart';
import 'package:test1/view/components/icon_svg_button.dart';
import 'package:test1/view/components/paragraph_text.dart';
import '../../controllers/filter_controller.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colorpallets.dart';
import '../../utils/routes/routes_name.dart';

class Navbar extends StatefulWidget {
  String title;
  bool isVisible;
  String subtitle;
  bool filter;
  bool search;
  bool cart;
  bool backButton;
  dynamic cartCount;

  Navbar({
    super.key,
    required this.title,
    required this.isVisible,
    required this.subtitle,
    required this.filter,
    required this.search,
    required this.cart,
    required this.backButton,
    required this.cartCount,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late FiltersController filtersController = FiltersController();

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    filtersController = Provider.of<FiltersController>(context, listen: false);
    filtersController.allFiltersListController(context);

    List<String> condition = [];
    List<String>? make = [];
    List<String> ram = [];
    List<String> storage = [];

    return Container(
      width: screenwidth,
      height: screenhight * 0.07,
      color: Color.fromARGB(255, 44, 46, 67),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
  width: screenwidth * 0.11,
  height: screenhight * 0.05,
  alignment: Alignment.centerLeft, // Align to the extreme left
  child: widget.backButton == true
      ? InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            width: screenwidth * 0.11,
            height: screenhight * 0.05,
            child: Icon(
              Icons.arrow_back_ios_new,
              size: screenwidth * 0.05,
              color: TheamColors.primaryColor,
            ),
          ),
        )
      : Image.asset(
          'assets/hamburger.png', // Replace with the actual asset path of your hamburger menu PNG image
          fit: BoxFit.contain, // Adjust the fit to your preference
          color: TheamColors.primaryColor, // Set the color of the image if needed
        ),
),

            ],
          ),
          Container(
  width: screenwidth * 0.20,
  height: screenhight * 0.05,
  child: widget.backButton == true
      ? InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            width: screenwidth * 0.11,
            height: screenhight * 0.05,
            child: Icon(
              Icons.arrow_back_ios_new,
              size: screenwidth * 0.05,
              color: TheamColors.primaryColor,
            ),
          ),
        )
      : ClipRRect(
          child: Image.asset(
            'assets/logo-removebg-preview.png', // Replace with the actual asset path of your PNG logo
            fit: BoxFit.fill,
          ),
        ),
),


          Visibility.maintain(
            visible: widget.filter,
            child: Container(
                width: screenwidth * 0.06,
                height: screenhight * 0.02,
                child: Consumer<FiltersController>(
                  builder: (context, value, child) {
                    return IconSvgButton(
                      crowselclick: () async {
                        // if (value.filters.filters!.condition != null) {

                        print(value.filters.filters!.condition);
                        condition =
                            value.filters.filters!.condition as List<String> ??
                                [];
                        make =
                            value.filters.filters!.make as List<String> ?? [];
                        ram = value.filters.filters!.ram as List<String> ?? [];
                        storage =
                            value.filters.filters!.storage as List<String> ??
                                [];

                        await showCoustomBottomSheet(context, screenwidth,
                            screenhight, condition, make, ram, storage);
                        // }
                      },
                      height: screenhight,
                      width: screenwidth,
                      iconimage: AssetImgLinks.filter,
                      iconImageColor: TheamColors.primaryColor,
                    );
                  },
                )),
          ),
          Visibility.maintain(
            visible: widget.search,
            child: IconSvgButton(
              crowselclick: () {
                Navigator.pushNamed(context, RoutesName.searchScreen);
              },
              height: screenhight,
              width: screenwidth,
              iconimage: AssetImgLinks.search,
              iconImageColor: TheamColors.primaryColor,
            ),
          ),
          Visibility.maintain(
            visible: widget.cart,
            child: Stack(
              children: [
                Positioned(
                    right: 0,
                    child: Container(
                        alignment: Alignment.center,
                        width: screenwidth * 0.035,
                        height: screenhight * 0.016,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 73, 73),
                            borderRadius: BorderRadius.circular(100)),
                        child: Text(
                          "0",
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white70),
                        ))),
                IconSvgButton(
                  crowselclick: () {
                    // Navigator.pushNamed(context, RoutesName.myCart);
                  },
                  height: screenhight,
                  width: screenwidth,
                  iconimage: AssetImgLinks.cart,
                  iconImageColor: TheamColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
