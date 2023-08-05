import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:like_button/like_button.dart';

class CoustomLike extends StatefulWidget {
  dynamic initLikes;
  IconData icons;
  dynamic likeValue;
  Function isLiked;

  CoustomLike({
    super.key,
    required this.initLikes,
    required this.icons,
    required this.likeValue,
    required this.isLiked,
  });

  @override
  State<CoustomLike> createState() => _CoustomLikeState();
}

class _CoustomLikeState extends State<CoustomLike> {
  dynamic Liked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Liked = !Liked;
        });
        widget.isLiked(Liked);
      },
      child: Container(
        width: 50,
        height: 50,
        // color: Colors.amber,
        child:  Icon(
              Icons.favorite,
              color: Liked ? Colors.deepPurpleAccent : Colors.grey,
              size: 22,
            ),
      ),
    );
  }
}










//  @override
//   Widget build(BuildContext context) {
//     final dynamic screenhight = MediaQuery.of(context).size.height;
//     final dynamic screenwidth = MediaQuery.of(context).size.width;
//     return Container(
//       // color: Color.fromARGB(255, 197, 246, 22),
//       width: screenwidth * 0.10,
//       height: screenhight * 0.04,
//       child: LikeButton(
//         circleColor:
//             CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
//         bubblesColor: BubblesColor(
//           dotPrimaryColor: Color(0xff33b5e5),
//           dotSecondaryColor: Color(0xff0099cc),
//         ),
//         // isLiked: false,
//         likeCount: initLikes,
//         countDecoration: (count, likeCount) {
//           return Visibility(
//               visible: false,
//               child: Container(
//                 child: Text(""),
//               ));
//         },
//         countBuilder: (likeCount, Liked, text) {

//             isLiked(Liked);
//           // print(
//           //     "=========newLiked  $likeCount, $isLiked, $text ============== value ");

//           // if (isLiked == true) {
//           //   isLikeBtnClicked = isLiked;
//           //   inputFieldData = {
//           //     "id": widget.productId,
//           //     "like": likeCount
//           //   };
//           //   print(
//           //       "===$isLiked======newLiked value : $likeCount  old value is : ${widget.likes}");
//           //   productController.likeratingProductsController(
//           //       context, inputFieldData);
//           // } else {
//           //   isLikeBtnClicked = isLiked;
//           //   inputFieldData = {
//           //     "id": widget.productId,
//           //     "like": likeCount
//           //   };
//           //   print(
//           //       "=========newLiked value : $likeCount  old value is : ${widget.likes}");
//           //   productController.likeratingProductsController(
//           //       context, inputFieldData);
//           // }

//           // if (isLiked == true) {
//           //   inputFieldData = {
//           //     "id": widget.productId,
//           //     "like": widget.likes + 1,
//           //     "isLiked": true
//           //   };
//           // } else {
//           //   // newLikeValue = widget.likes - 1;
//           //   // isLiked == true;
//           //   inputFieldData = {
//           //     "id": widget.productId,
//           //     "like": widget.likes - 1,
//           //     "isLiked": false
//           //   };
//           // }

//           // print("=========newLiked value :  old value is : ${widget.likes}");
//           // productController.likeratingProductsController(
//           //     context, inputFieldData);

//           return InkWell(
//             child: Icon(
//               Icons.favorite,
//               color: Liked ? Colors.deepPurpleAccent : Colors.grey,
//               size: screenwidth * 0.050,
//             ),
//           );
//         },

//         onTap: (Liked) async {
        
//          isLiked(Liked);
//         },
//       ),
//     );
//   }