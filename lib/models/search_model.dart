class SearchModel {
  List<String>? makes;
  List<String>? models;
  String? message;

  SearchModel({this.makes, this.models, this.message});

  SearchModel.fromJson(Map<String, dynamic> json) {
    makes = json['makes'].cast<String>();
    models = json['models'].cast<String>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['makes'] = this.makes;
    data['models'] = this.models;
    data['message'] = this.message;
    return data;
  }
}