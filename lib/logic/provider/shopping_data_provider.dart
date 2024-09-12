import 'package:flutter/material.dart';

import '../client/dio_api_client_implementation.dart';
import '../client/resource.dart';

class ShoppingDataProvider extends ChangeNotifier{

  DioAPIClientAPIImplementation dioClient = DioAPIClientAPIImplementation();

  getProductList() async{
    Resource resource = await dioClient.getData();
  }
}