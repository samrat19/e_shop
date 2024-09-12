import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_shop/logic/client/dio_api_client.dart';
import 'package:e_shop/logic/client/error_exception.dart';
import 'package:e_shop/logic/client/resource.dart';
import 'package:e_shop/logic/client/status.dart';
import 'package:e_shop/logic/model/shopping_item_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class DioAPIClientAPIImplementation extends DioApiClient {
  final Dio _dio = Dio();

  ErrorException errorException = ErrorException();

  @override
  Future<Resource> getData() async {
    try {
      var response = await _dio.get("https://jsonplaceholder.typicode.com/todos/1");

      print(response.statusCode.toString());

      if (response.statusCode == 200) {
        final String jsonString =
            await rootBundle.loadString('asset/dummy.json');
        final data = jsonDecode(jsonString);

        ProductListResponseModel productListResponseModel =
            ProductListResponseModel.fromJson(data);

        return Resource(
          status: Status.success,
          data: productListResponseModel,
          message: "",
        );
      } else {
        return Resource(
            status: Status.error, data: null, message: "Something went wrong");
      }
    } catch (e) {
      if (e is DioException) {
        return Resource(
          status: Status.error,
          data: null,
          message: errorException.getException(
            e.response!.statusCode!,
          ),
        );
      } else {
        return Resource(
          status: Status.error,
          data: null,
          message: "Something went Wrong",
        );
      }
    }
  }
}
