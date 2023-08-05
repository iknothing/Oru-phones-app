import 'package:flutter/foundation.dart';
import 'package:test1/models/filter_model.dart';
import '../repository/filter_repo.dart';

class FiltersController with ChangeNotifier {
  final productRepo = FiltersRepository();

  bool _loading = false;
  bool get loading => _loading;

  late FilterModel _filters = FilterModel();
  FilterModel get filters => _filters;



  setLoadingState(bool val) {
    _loading = val;
  }


  // product controller for fetching all product filters from backend to home screen 
  Future allFiltersListController(context) async {
    try {
      setLoadingState(true);
      var filterRes = await productRepo.filterRepo(context);
      _filters = filterRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_filters : ${_filters.message}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }


}