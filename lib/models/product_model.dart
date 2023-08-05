class ProductModel {
  List<Listings>? listings;
  String? nextPage;
  String? message;

  ProductModel({this.listings, this.nextPage, this.message});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['listings'] != null) {
      listings = <Listings>[];
      json['listings'].forEach((v) {
        listings!.add(new Listings.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listings != null) {
      data['listings'] = this.listings!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = this.nextPage;
    data['message'] = this.message;
    return data;
  }
}

class Listings {
  String? sId;
  String? deviceCondition;
  String? listedBy;
  String? deviceStorage;
  List<Images>? images;
  Images? defaultImage;
  String? listingLocation;
  String? make;
  String? marketingName;
  String? mobileNumber;
  String? model;
  bool? verified;
  String? status;
  String? listingDate;
  String? deviceRam;
  String? createdAt;
  String? listingId;
  int? listingNumPrice;
  String? listingState;

  Listings(
      {this.sId,
      this.deviceCondition,
      this.listedBy,
      this.deviceStorage,
      this.images,
      this.defaultImage,
      this.listingLocation,
      this.make,
      this.marketingName,
      this.mobileNumber,
      this.model,
      this.verified,
      this.status,
      this.listingDate,
      this.deviceRam,
      this.createdAt,
      this.listingId,
      this.listingNumPrice,
      this.listingState});

  Listings.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    deviceCondition = json['deviceCondition'];
    listedBy = json['listedBy'];
    deviceStorage = json['deviceStorage'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    defaultImage = json['defaultImage'] != null
        ? new Images.fromJson(json['defaultImage'])
        : null;
    listingLocation = json['listingLocation'];
    make = json['make'];
    marketingName = json['marketingName'];
    mobileNumber = json['mobileNumber'];
    model = json['model'];
    verified = json['verified'];
    status = json['status'];
    listingDate = json['listingDate'];
    deviceRam = json['deviceRam'];
    createdAt = json['createdAt'];
    listingId = json['listingId'];
    listingNumPrice = json['listingNumPrice'];
    listingState = json['listingState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['deviceCondition'] = this.deviceCondition;
    data['listedBy'] = this.listedBy;
    data['deviceStorage'] = this.deviceStorage;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.defaultImage != null) {
      data['defaultImage'] = this.defaultImage!.toJson();
    }
    data['listingLocation'] = this.listingLocation;
    data['make'] = this.make;
    data['marketingName'] = this.marketingName;
    data['mobileNumber'] = this.mobileNumber;
    data['model'] = this.model;
    data['verified'] = this.verified;
    data['status'] = this.status;
    data['listingDate'] = this.listingDate;
    data['deviceRam'] = this.deviceRam;
    data['createdAt'] = this.createdAt;
    data['listingId'] = this.listingId;
    data['listingNumPrice'] = this.listingNumPrice;
    data['listingState'] = this.listingState;
    return data;
  }
}

class Images {
  String? fullImage;

  Images({this.fullImage});

  Images.fromJson(Map<String, dynamic> json) {
    fullImage = json['fullImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullImage'] = this.fullImage;
    return data;
  }
}