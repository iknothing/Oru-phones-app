import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/product_controller.dart';
import '../../utils/constants/colorpallets.dart';
import '../components/card2.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  late ProductController productController = ProductController();

  TextEditingController searchBarInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    productController = Provider.of<ProductController>(context, listen: false);
    productController
        .searchProductsController(context, {"searchModel": "iphone"});

    return Scaffold(
      body: Container(
        color: TheamColors.backgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              ////////////////////////////
              Container(
                width: screenwidth,
                height: screenhight * 0.07,
                // color: Color.fromARGB(255, 7, 52, 255),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: screenwidth * 0.11,
                                height: screenhight * 0.05,
                                // color: Color.fromARGB(255, 207, 212, 222),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: screenwidth * 0.05,
                                  color: TheamColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ////////////////////////////////
                        Container(
                          width: screenwidth * 0.76,
                          height: screenhight * 0.05,
                          // color: Color.fromARGB(255, 207, 212, 222),
                          child: TextFormField(
                              autocorrect: true,
                              onEditingComplete: () => productController
                                      .searchProductsController(context, {
                                    "searchModel":
                                        searchBarInput.text.toString()
                                  }),
                              onFieldSubmitted: (String value) {},
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Product should not be empty ';
                                } else {
                                  return null;
                                }
                              },
                              controller: searchBarInput,
                              onChanged: (value) {},
                              style: TextStyle(color: TheamColors.primaryColor),
                              textAlign: TextAlign.justify,
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                hintText: "Search product here",

                                hintStyle:
                                    TextStyle(color: TheamColors.primaryColor),
                                // labelStyle: TextStyle(  color: Colors.amber,),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      color: TheamColors.backgroundColor,
                                      width: 0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      color: TheamColors.backgroundColor,
                                      width: 0),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ///////////////////////////////////
              SizedBox(
                height: screenhight * 0.01,
              ),
              Consumer<ProductController>(
                builder: (BuildContext context, value, Widget? child) {
                  var dataListLength = value.searchProducts.models;
                  if (value.loading == true || dataListLength == null ) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (dataListLength.length == 0 || dataListLength == null) {
                      return Center(
                        child: Text("No product found"),
                      );
                    } else {
                      return Expanded(
                        child: Container(
                            width: screenwidth,
                            height: screenhight * 0.36,
                            // color: Color.fromARGB(255, 214, 83, 83),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              // itemCount: 2,
                              itemCount: value.searchProducts.models!.length,
                              itemBuilder: (context, index) {
                                var items = value.searchProducts.models![index];
                                return Wrap(
                                  runSpacing: screenwidth * 0.03,
                                  alignment: WrapAlignment.spaceEvenly,
                                  children: [
                                    Card2(
                                      discription: "Iphone 13 pro max,8gb Ram",
                                      price: 30000.toString(),
                                      thumbnailImage: "https://purepng.com/public/uploads/large/purepng.com-apple-iphone-xappleapple-iphonephonesmartphonemobile-devicetouch-screeniphone-xiphone-10electronicsobjects-2515306895701eqxj.png",
                                      title: items.toString(),
                                      productId: "3456789098765",
                                      starRating: 4 as num,
                                    ),
                                  ],
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
    );
  }
}
