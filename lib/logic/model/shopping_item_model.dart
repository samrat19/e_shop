class ProductListResponseModel {
  bool? status;
  List<ProductItemList>? productItemList;
  String? message;

  ProductListResponseModel({this.status, this.productItemList, this.message});

  ProductListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['product_item_list'] != null) {
      productItemList = <ProductItemList>[];
      json['product_item_list'].forEach((v) {
        productItemList!.add(ProductItemList.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class ProductItemList {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductItemList(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  ProductItemList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }
}
