import 'package:clint_store/models/product_model_client.dart';

class Designer {
  String? message;
  List<Product>? products;

  Designer({this.message, this.products});

  Designer.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['Products'] != null) {
      products = <Product>[];
      json['Products'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['message'] = this.message;
//   if (this.products != null) {
//     data['Products'] = this.products!.map((v) => v.toJson()).toList();
//   }
//   return data;
// }
}