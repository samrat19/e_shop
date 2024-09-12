import 'package:e_shop/screens/item_details_screen.dart';
import 'package:e_shop/screens/widget/item_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/provider/shopping_data_provider.dart';
import 'widget/search_bar_widget.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ShoppingDataProvider>(context, listen: false)
          .getProductList();
    });
  }

  String searchValue = "";

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<ShoppingDataProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: controller.itemResponse == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : controller.itemResponse!.productItemList!.isEmpty
              ? const Center(
                  child: Text("No Product Found"),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SearchBarWidget(
                        onChanged: (val) {
                          searchValue = val;
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (_, index) => const SizedBox(
                          height: 20,
                        ),
                        itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: ItemListWidget(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ItemDetailsScreen(
                                      item: controller
                                          .itemResponse!.productItemList!
                                          .where((element) => element.title!
                                              .contains(searchValue))
                                          .toList()[index])));
                            },
                            item: controller.itemResponse!.productItemList!
                                .where((element) =>
                                    element.title!.contains(searchValue))
                                .toList()[index],
                          ),
                        ),
                        itemCount: controller.itemResponse!.productItemList!
                            .where((element) =>
                                element.title!.contains(searchValue))
                            .toList()
                            .length,
                      ),
                    ),
                  ],
                ),
    );
  }
}
