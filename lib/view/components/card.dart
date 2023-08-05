import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/view/components/heading_text.dart';
import 'package:test1/view/components/like.dart';
import 'package:test1/view/components/paragraph_text.dart';
import '../../controllers/product_controller.dart';
import '../../utils/constants/colorpallets.dart';

class Card1 extends StatefulWidget {
  String productId;
  String thumbnailImage;
  String title;
  String discription;
  String price;
  Function addToCart;
  // dynamic likes;

  Card1({
    super.key,
    required this.productId,
    required this.thumbnailImage,
    required this.title,
    required this.discription,
    required this.price,
    required this.addToCart,
    // required this.likes,
  });

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  // late dynamic newLikeValue;
  // late dynamic isLikeBtnClicked;
  late Map inputFieldData = {};
  late ProductController productController = ProductController();

  @override
  void initState() {
    productController = Provider.of<ProductController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, RoutesName.productsDetail,
        //     arguments: {"SingleProduct": widget.SingleProduct});
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: screenwidth * 0.42,
        height: screenhight * 0.34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: TheamColors.cardColor,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              children: [
                Container(
                  width: screenwidth * 0.42,
                  height: screenhight * 0.16,
                  // alignment: Alignment.center,
                  child:

                        CachedNetworkImage(
                      imageUrl: widget.thumbnailImage ?? "https://images.unsplash.com/photo-1486663845017-3eedaa78617f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
                             width: screenwidth * 0.40,
                    height: screenhight * 0.16,
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fadeOutDuration: const Duration(milliseconds: 1000),
                      fadeOutCurve: Curves.easeOut,
                      fadeInDuration: const Duration(milliseconds: 500),
                    ),
                  
                ),
                SizedBox(
                  height: screenhight * 0.01,
                ),
                Container(
                  width: screenwidth * 0.38,
                  height: screenhight * 0.15,
                  // color: Colors.blueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: screenwidth * 0.38,
                        height: screenhight * 0.03,
                        // color: Color.fromARGB(255, 64, 255, 166),
                        child: H1text(
                          fonttext: widget.title,
                          size: screenwidth * 0.036,
                          weight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: screenhight * 0.01,
                      ),
                      Container(
                        width: screenwidth * 0.38,
                        height: screenhight * 0.060,
                        // color: Colors.amberAccent,
                        child: Ptext(
                          fonttext: widget.discription,
                          size: screenwidth * 0.026,
                          weight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: screenhight * 0.01,
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              H1text(
                                fonttext: " \u{20B9} ${widget.price}",
                                size: screenwidth * 0.038,
                                weight: FontWeight.w600,
                              ),
                              InkWell(
                                onTap: () {
                                  widget.addToCart();
                                },
                                child: Container(
                                    width: screenwidth * 0.12,
                                    height: screenhight * 0.036,
                                    decoration: BoxDecoration(
                                        color: TheamColors.primaryColor,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Icon(
                                      Icons.add,
                                      color: TheamColors.backgroundColor,
                                    )),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Consumer(
              builder: (BuildContext context, value, Widget? child) {
                return Positioned(
                    top: 6,
                    right: 6,
                    child: CoustomLike(
                      icons: Icons.favorite,
                      // initLikes: widget.likes,
                      isLiked: (like) {
                        // print(like);

                        // if (like == true) {
                        //   inputFieldData = {
                        //     "id": widget.productId,
                        //     "like": widget.likes + 1,
                        //     "isLiked": true
                        //   };
                        // } else {
                        //   var value = widget.likes -
                        //       1; // value =<  0 ? 0widget.likes - 1;
                        //   value <= 0
                        //       ? inputFieldData = {
                        //           "id": widget.productId,
                        //           "like": 0,
                        //           "isLiked": false
                        //         }
                        //       : inputFieldData = {
                        //           "id": widget.productId,
                        //           "like": widget.likes - 1,
                        //           "isLiked": false
                        //         };
                        // }

                      },
                      likeValue: null, initLikes: null,
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
