import 'dart:convert';
import 'dart:developer';

import 'package:dummy_ecomerce/core/enum/api_status.dart';
import 'package:dummy_ecomerce/core/model/product_model.dart';
import 'package:dummy_ecomerce/core/model/response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<ResponseModel<List<ProductModel>>> fetchAllProducts() async {
    try {

      final res = await http.get(Uri.parse("https://dummyjson.com/products"));
      switch (res.statusCode) {
        case 200:
          final jsonData = jsonDecode(res.body);
          final list = ProductModel.jsonToList(jsonData["products"] ?? []);
          return ResponseModel.success(data: list);
        default:
          return ResponseModel.error(message: "");
      }

    } catch (e, stack) {
      debugPrintStack(label: e.toString(), stackTrace: stack);
      return ResponseModel.error(message: "Something went wrong");
    }
  }
}
