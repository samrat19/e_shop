import 'package:e_shop/logic/model/shopping_item_model.dart';
import 'package:flutter/material.dart';

class ItemListWidget extends StatelessWidget {
  final ProductItemList item;
  final Function onTap;

  const ItemListWidget({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: item.id.toString(),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(item.image ?? ""))),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title ?? "",
                  maxLines: 3,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "${item.price!.toString()} \$",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
