import 'package:e_shop/logic/model/shopping_item_model.dart';
import 'package:e_shop/logic/provider/shopping_data_provider.dart';
import 'package:e_shop/screens/widget/mark_favourite_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetailsScreen extends StatelessWidget {
  final ProductItemList item;

  const ItemDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          InkWell(
            onTap: () {
              Provider.of<ShoppingDataProvider>(context, listen: false)
                  .markFavouriteItem(item.id!);
            },
            child: MarkFavouriteWidget(
              id: item.id!,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Hero(
                    tag: item.id.toString(),
                    child: Image.network(
                      item.image!,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 2,
                  child: RichText(
                    text: TextSpan(
                        text: item.title!.substring(0, 10),
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.blueGrey[700],
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: item.title!.substring(
                                10,
                                item.title!.length,
                              ),
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.blueGrey[300],
                                fontWeight: FontWeight.w400,
                              ))
                        ]),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              item.description ?? "",
              style: TextStyle(fontSize: 16, color: Colors.blueGrey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
