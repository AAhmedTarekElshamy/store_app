import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helper/api.dart';
import '../models/ProductsModel.dart';

// class AllProductsService {
//   String baseUrl = 'https://fakestoreapi.com';
//   Future<List<ProductModel>?> getAllProduct() async {
//     List<ProductModel> productList = [];
//
//     //await http.get(Uri.parse('$baseUrl/products')) as http.Response;
//     List<dynamic> data = await Api().get(url: '$baseUrl/products/') ;
// //
//     for (int i = 0; i < data.length; i++) {
//       productList.add(ProductModel.fromJson(data[i]));
//     }
//     return productList;
//   }
// }
class AllProductsService {
  String baseUrl = 'https://fakestoreapi.com';

  Future<List<ProductModel>?> getAllProduct() async {
    List<ProductModel> productList = [];

    try {
      // Use the Api helper to fetch data
      List<dynamic> data = await Api().get(url: '$baseUrl/products');

      // Ensure the data is a list and iterate through it
      if (data is List) {
        for (var item in data) {
          productList.add(ProductModel.fromJson(item));
        }
      }

      return productList;
    } catch (e) {
      print('Error fetching products: $e');
      return null; // or rethrow if you want to handle it at a higher level
    }
  }
}