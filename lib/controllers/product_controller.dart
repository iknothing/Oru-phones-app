import 'package:flutter/foundation.dart';
import '../models/product_model.dart';
import '../models/search_model.dart';
import '../repository/product_repo.dart';

class ProductController with ChangeNotifier {
  final productRepo = ProductRepository();

  bool _loading = false;
  bool get loading => _loading;

  late ProductModel _products = ProductModel();
  ProductModel get products => _products;

  List<Listings> _newlist = [];
  List<Listings> get newlist => _newlist;

  late SearchModel _searchProducts = SearchModel();
  SearchModel get searchProducts => _searchProducts;

  setLoadingState(bool val) {
    _loading = val;
  }

  // product  controller for fetching all products and displaying it to frountend
  Future getAllProductsController(context, query) async {
    try {
      setLoadingState(true);
      var productsRes = await productRepo.getAllProductsRepo(context, query);
      _products = productsRes;
      _newlist = [...?products.listings];
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_products : ${_products.message}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

  Future loadMoreController(context, page) async {
    print("the count of page is = $page");
    try {
      ProductModel productsRes =
          await productRepo.getAllProductsRepo(context, "?page=$page&limit=10");
      _newlist = [...?products.listings, ...productsRes.listings as List];
      _products.listings = newlist;
      _newlist = _newlist;
      notifyListeners();
      if (kDebugMode) {
        print("_products : ${_products.message}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

  // product controller for searching product insearch bar from backend to frountend
  Future searchProductsController(context, searchInputData) async {
    try {
      setLoadingState(true);
      var productsRes =
          await productRepo.productsSearchRepo(context, searchInputData);
      _searchProducts = productsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_searchProducts : ${_searchProducts.message}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }
}
