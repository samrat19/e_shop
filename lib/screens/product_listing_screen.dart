import 'package:e_shop/logic/provider/shopping_data_provider.dart';
import 'package:e_shop/screens/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<ShoppingDataProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My List"),
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SearchBarWidget(),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(controller
                                                .itemResponse!
                                                .productItemList![index]
                                                .image ??
                                            ""))),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.itemResponse!
                                              .productItemList![index].title ??
                                          "",
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
                                        "${controller.itemResponse!.productItemList![index].price!.toString()} \$",
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
                        ),
                        itemCount:
                            controller.itemResponse!.productItemList!.length,
                      ),
                    ),
                  ],
                ),
    );
  }
}
