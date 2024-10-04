

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/ProductsModel.dart';


class AllCategoriesService{
  String baseUrl ='https://fakestoreapi.com';
  Future<List<dynamic>> GetAllCategories()async{

List<dynamic> list = Api().get(url:'$baseUrl/categories' ) as List;
List<ProductModel> categoriesList =[];
for (int i =1;i<list.length;i++){
  categoriesList.add(ProductModel.fromJson(list[i]));
}
return categoriesList;
}

}

