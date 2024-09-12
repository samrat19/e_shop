import 'package:e_shop/logic/client/status.dart';
import 'package:e_shop/logic/model/shopping_item_model.dart';
import 'package:e_shop/main.dart';
import 'package:flutter/material.dart';

import '../client/dio_api_client_implementation.dart';
import '../client/resource.dart';

class ShoppingDataProvider extends ChangeNotifier {
  DioAPIClientAPIImplementation dioClient = DioAPIClientAPIImplementation();

  ProductListResponseModel? itemResponse;

  List<int> favouriteProducts = [];

  getProductList() async {
    Resource resource = await dioClient.getData();

    itemResponse = null;

    if (resource.status == Status.success) {
      itemResponse = resource.data as ProductListResponseModel;
      notifyListeners();
    } else {
      itemResponse = null;

      ScaffoldMessenger.of(navigationKey.currentContext!).showSnackBar(
        SnackBar(content: Text(resource.message ?? "Something went wrong")),
      );
    }
  }

  markFavouriteItem(int id) {
    if (favouriteProducts.contains(id)) {
      favouriteProducts.remove(id);
    } else {
      favouriteProducts.add(id);
    }
    notifyListeners();
  }
}
