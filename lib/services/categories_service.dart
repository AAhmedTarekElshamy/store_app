import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helper/api.dart';
import '../models/ProductsModel.dart';

class categoriesService {
  String baseUrl = 'https://fakestoreapi.com';
  Future<List<ProductModel>?> getCategoriesProduct(
      {required String categoryName}) async {
    List<ProductModel> productList = [];

    List<dynamic> data =
        Api().get(url: '$baseUrl/products/category/$categoryName') as List;

    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
