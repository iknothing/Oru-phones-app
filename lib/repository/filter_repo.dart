import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test1/models/filter_model.dart';
import 'package:test1/models/search_model.dart';
import '../data/base_api.dart';
import '../data/network_api.dart';
import '../models/product_model.dart';
import '../utils/constants/api_endpoints.dart';
import '../utils/constants/colorpallets.dart';
import '../utils/listners_utils.dart';

class FiltersRepository {
  BaseApi _apiServices = networkApi();

  late dynamic apiResponse;
  late FilterModel filterResponse = FilterModel();


  // function to featch all filter of product from the backend database
  Future filterRepo(context) async {
    try {
      apiResponse =
          await _apiServices.getApiResponse(ApiEndpointsUrl.filters, context);
           if (kDebugMode) {
        print(apiResponse['message']);
      }
      filterResponse = FilterModel.fromJson(apiResponse);
       if (kDebugMode) {
        print(filterResponse.message);
      }
      return filterResponse;
    } catch (ex, stack) {
      if (kDebugMode) {
        print(ex);
        print(stack);
      }
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }
}