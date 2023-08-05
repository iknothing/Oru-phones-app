


class Formater {
  static likeformater(String likes) {
    late double thousand = int.parse(likes) / 1000;
    late double lakh = int.parse(likes) / 100000;

    if (likes.length == 4 || likes.length == 5) {
      return "${thousand.toInt()}K";
    } else if (likes.length == 6 || likes.length == 7) {
      return "${lakh.toInt()}M";
    } else {
      return likes;
    }
  }

  static calculateTotal(List data)  {
    late num discountPrice;
    late num total;

    discountPrice =  data.fold(
        0,
        (value, element) =>
            value + element.product!.discountPercentage! * element.quantity);
    total = data.fold(0,
        (value, element) => value + element.product!.price! * element.quantity);

    return <String, dynamic>{"total": total, "discountPrice": discountPrice};
  }


}
