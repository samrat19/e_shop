import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/provider/shopping_data_provider.dart';

class MarkFavouriteWidget extends StatelessWidget {

  final int id;

  const MarkFavouriteWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<ShoppingDataProvider>();

    return controller.favouriteProducts.contains(id)
        ? const Icon(
            Icons.favorite,
            color: Colors.red,
          )
        : const Icon(
            Icons.favorite_border_outlined,
          );
  }
}
