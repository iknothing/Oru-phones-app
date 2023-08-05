import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/controllers/filter_controller.dart';
import '../../controllers/product_controller.dart';
import '../../utils/constants/colorpallets.dart';
import '../components/bottom_bar.dart';
import '../components/card.dart';
import '../components/card_header.dart';
import '../components/carousel.dart';
import '../components/heading_text.dart';
import '../components/navbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ProductController productController = ProductController();
  late FiltersController filtersController = FiltersController();



  @override
  void initState() {
    productController = Provider.of<ProductController>(context, listen: false);
    filtersController = Provider.of<FiltersController>(context, listen: false);

    // filtersController.allFiltersListController(context);
    productController.getAllProductsController(context, "?page=1&limit=10");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    var count = 1;
    const height = 150.0;


      return Scaffold(
        body: SafeArea(
          child: Container(
              child: Column(children: [
            // Navbar section  ==================================================================
            Navbar(
              isVisible: true,
              title: 'ORU PHONES',
              subtitle: 'WELCOME',
              cart: true,
              filter: true,
              search: true,
              backButton: false,
              cartCount: 0.toString(),
            ),
            CardHeader(
              titleText: "FEATURED PHONES",
              navigateToList: () {},
              isVisible: true,
            ),
            // top selling products crowsel slider component ==================================================================
            Consumer<ProductController>(
              builder: (BuildContext context, value, Widget? child) {
                var items = value.newlist;
                return value.loading == true || items == null
                    ? Container(
                        height: screenwidth * 0.60,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          color: Colors.deepPurpleAccent,
                        ))
                    : items.length == 0
                        ? Center(
                            child: H1text(
                              fonttext: "No products",
                              size: screenwidth * 0.028,
                              weight: FontWeight.w500,
                            ),
                          )
                        : CrowselSlider(
                            crowselclick: () {},
                            data: value.newlist,
                            height: screenhight,
                            width: screenwidth,
                          );
              },
            ),

            // body section  ==================================================================

            CardHeader(
              titleText: "Best Deals Near You",
              navigateToList: () {},
              isVisible: true,
            ),
            Expanded(
              child: CustomRefreshIndicator(
                builder: (BuildContext context, Widget child,
                    IndicatorController controller) {
                  return AnimatedBuilder(
                      animation: controller,
                      builder: (context, _) {
                        final dy = controller.value.clamp(0.0, 1.25) *
                            -(height - (height * 0.25));
                        return Stack(
                          children: [
                            Transform.translate(
                              offset: Offset(0.0, dy),
                              child: child,
                            ),
                            Positioned(
                              bottom: -height,
                              left: 0,
                              right: 0,
                              height: height,
                              child: Container(
                                transform:
                                    Matrix4.translationValues(0.0, dy, 0.0),
                                padding: const EdgeInsets.only(top: 30.0),
                                constraints: const BoxConstraints.expand(),
                                child: Column(
                                  children: [
                                    if (controller.isLoading)
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 8.0),
                                        width: 16,
                                        height: 16,
                                        child: const CircularProgressIndicator(
                                          color: Colors.blueAccent,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    else
                                      const Icon(
                                        Icons.keyboard_arrow_up,
                                        color: Colors.black,
                                      ),
                                    Text(
                                      controller.isLoading
                                          ? "Cooking some new phones for you..."
                                          : "Pull to load some more phones",
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                onRefresh: () async {
                  count = count + 1;
                  await productController.loadMoreController(context, count);
                },
                trigger: IndicatorTrigger.trailingEdge,
                trailingScrollIndicatorVisible: false,
                leadingScrollIndicatorVisible: true,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenhight * 0.01,
                      ),
                      Consumer<ProductController>(
                        builder: (BuildContext context, value, Widget? child) {
                          print("value new : ${value.newlist.length}");

                          var dataListLength = value.newlist;

                          if (value.loading == true || dataListLength == null) {
                            return Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(
                                    color: Colors.deepPurpleAccent,
                                  )),
                            );
                          } else {
                            if (dataListLength.length == 0 ||
                                dataListLength == null) {
                              return Center(
                                child: Text("No products"),
                              );
                            } else {
                              return Expanded(
                                child: Container(
                                    width: screenwidth,
                                    height: screenhight * 0.36,
                                    // color: Color.fromARGB(255, 214, 83, 83),
                                    child: GridView.builder(
                                      shrinkWrap: false,
                                      itemCount: value.newlist.length,
                                      gridDelegate:
                                          new SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 2 / 3,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var items = value.newlist[index];
                                        return Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 5, 0, 5),
                                          child: Card1(
                                            addToCart: () {},
                                            discription:
                                                "${items.deviceStorage}         ${items.deviceCondition}"
                                                    .toString(),
                                            price: items.listingNumPrice
                                                .toString(),
                                            thumbnailImage: items
                                                .defaultImage!.fullImage
                                                .toString(),
                                            title: items.model.toString(),
                                            productId: items.sId.toString(),
                                          ),
                                        );
                                      },
                                    )),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            BottomBar(
              backgroundColor: TheamColors.backgroundColor,
              iconColor: TheamColors.primaryColor,
              screen: () {},
            )
          ])),
        ),
      );

  }
}
