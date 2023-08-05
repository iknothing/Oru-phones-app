import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/view/components/heading_text.dart';
import 'package:test1/view/components/like.dart';
import 'package:test1/view/components/paragraph_text.dart';
import '../../controllers/product_controller.dart';
import '../../utils/constants/colorpallets.dart';

class Card2 extends StatefulWidget {
  String productId;
  String thumbnailImage;
  String title;
  String discription;
  String price;
  num starRating;

  Card2({
    super.key,
    required this.productId,
    required this.thumbnailImage,
    required this.title,
    required this.discription,
    required this.price,
    required this.starRating,
  });

  @override
  State<Card2> createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  late Map inputFieldData = {};
  late ProductController productController = ProductController();

  @override
  void initState() {
    productController = Provider.of<ProductController>(context, listen: false);
    super.initState();
  }

  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {

      },
      child: Container(
        width: screenwidth * 0.90,
        height: screenhight * 0.14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: TheamColors.cardColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenwidth * 0.22,
                  height: screenhight * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: Color(0x4c000000),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: widget.thumbnailImage,
                      width: screenwidth * 0.15,
                      height: screenhight * 0.06,
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fadeOutDuration: const Duration(milliseconds: 1000),
                      fadeOutCurve: Curves.easeOut,
                      fadeInDuration: const Duration(milliseconds: 500),
                    ),
                  ),
                ),
                SizedBox(width: screenwidth * 0.05),
                Container(
                  width: screenwidth * 0.56,
                  height: screenhight * 0.086,
                  // color: Color.fromARGB(255, 128, 64, 255),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: screenwidth * 0.42,
                            height: screenhight * 0.028,
                            // color: Color.fromARGB(255, 64, 255, 166),
                            child: H1text(
                              fonttext: widget.title,
                              size: screenwidth * 0.036,
                              weight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: screenwidth * 0.42,
                            height: screenhight * 0.030,
                            alignment: Alignment.topLeft,
                            // color: Colors.amberAccent,
                            child: H1text(
                              fonttext: widget.discription,
                              size: screenwidth * 0.026,
                              weight: FontWeight.w300,
                            ),
                          ),
                          H1text(
                            fonttext: " \u{20B9} ${widget.price}",
                            size: screenwidth * 0.038,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Column(
                          children: [
                            Container(
                              width: screenwidth * 0.10,
                              height: screenhight * 0.03,
                              alignment: Alignment.center,
                              // color: TheamColors.primaryColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.deepPurpleAccent,
                                    size: screenwidth * 0.04,
                                  ),
                                  Ptext(
                                    fonttext: widget.starRating.toString(),
                                    size: screenwidth * 0.024,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            Consumer(
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return Expanded(
                                    child: Container(
                                        // color: Color.fromARGB(255, 197, 246, 22),
                                        width: screenwidth * 0.10,
                                        height: screenhight * 0.04,
                                        child: CoustomLike(
                                          icons: Icons.favorite,
                                          initLikes: 0,
                                          isLiked: (like) {
                                          
                                          },
                                          likeValue: null,
                                        )));
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
