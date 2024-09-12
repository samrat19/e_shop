import 'package:dio/dio.dart';
import 'package:e_shop/logic/client/dio_api_client.dart';
import 'package:e_shop/logic/client/resource.dart';
import 'package:e_shop/logic/client/status.dart';

class DioAPIClientAPIImplementation extends DioApiClient {
  final Dio _dio = Dio();

  @override
  Future<Resource> getData() async {
    try {

      var response = await _dio.get("path");

      if(response.statusCode == 200){
        return Resource(status: Status.success, data: "data", message: "message");
      }else{
        return Resource(status: Status.error, data: "data", message: "message");
      }
    } catch (e) {

      if(e is DioException){
        return Resource(status: Status.error, data: null, message: "message");
      }else{
        return Resource(status: Status.error, data: null, message: "message");
      }
    }
  }
}
