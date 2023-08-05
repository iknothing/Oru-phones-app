import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

import 'app_exception.dart';
import 'base_api.dart';

class networkApi extends BaseApi {
  dynamic jsonresponse;
  late var response;
  late var request;

  // making get api request function
  @override
  Future getApiResponse(String url, context) async {
    try {
      print("get runned");
      response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonresponse = httpResponses(response);

      if (kDebugMode) {
        print(url);
      }
    } on SocketException catch (ex) {
      throw InternetException(message: "").msgString();
    } on RequestTimeout catch (ex) {
      throw RequestTimeout(message: "").msgString();
    } on HttpException catch (ex) {
      throw HttpErrorException(message: "").msgString();
    } catch (ex) {
      print(ex);
      // throw UnhandledException(message: "").msgString();
    }
    return jsonresponse;
  }

  //  making post api request function
  @override
  Future postApiResponse(String url, data, context) async {
    try {
      response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json ',
        },
      ).timeout(const Duration(seconds: 10));
      jsonresponse = httpResponses(response);

      if (kDebugMode) {
        print(url);
      }
    } on SocketException catch (ex) {
      throw InternetException(message: "").msgString();
    } on RequestTimeout catch (ex) {
      throw RequestTimeout(message: "").msgString();
    } on HttpException catch (ex) {
      throw HttpErrorException(message: "").msgString();
    } catch (ex) {
      throw UnhandledException(message: "").msgString();
    }

    return jsonresponse;
  }

  // making delet api request function
  @override
  Future deletApiResponse(String url, data, context) async {
    try {
      if (kDebugMode) {
        print(url);
      }
      response = await http.delete(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json ',
        },
      ).timeout(const Duration(seconds: 10));
      jsonresponse = httpResponses(response);
    } on SocketException catch (ex) {
      throw InternetException(message: "").msgString();
    } on RequestTimeout catch (ex) {
      throw RequestTimeout(message: "").msgString();
    } on HttpException {
      throw HttpErrorException(message: "").msgString();
    } catch (ex) {
      throw UnhandledException(message: "").msgString();
    }

    return jsonresponse;
  }



  // status code checking function and passing dynamic data according to status code
  dynamic httpResponses(http.Response res) {
    switch (res.statusCode) {
      case 200:
        jsonresponse = jsonDecode(res.body);
        return jsonresponse;
      case 400:
        jsonresponse = jsonDecode(res.body);
        return jsonresponse;
      default:
        throw FetchDataException(message: "").msgString();
    }
  }

  @override
  Future updateApiResponse(String url, data, context) async {
    try {
      if (kDebugMode) {
        print(url);
      }
      response = await http.put(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json ',
        },
      ).timeout(const Duration(seconds: 10));
      jsonresponse = httpResponses(response);
    } on SocketException {
      throw InternetException(message: "").msgString();
    } on RequestTimeout {
      throw RequestTimeout(message: "").msgString();
    } on HttpException {
      throw HttpErrorException(message: "").msgString();
    } catch (ex) {
      throw UnhandledException(message: "").msgString();
    }

    return jsonresponse;
  }
}
