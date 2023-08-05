import 'package:flutter/foundation.dart';
import 'package:test1/models/search_model.dart';
import '../models/product_model.dart';
import '../repository/product_repo.dart';
import '../utils/constants/api_endpoints.dart';

class SearchController with ChangeNotifier {
  final productRepo = ProductRepository();

  bool _loading = false;
  bool get loading => _loading;



  setLoadingState(bool val) {
    _loading = val;
  }



}