import '../helper/api.dart';
import '../models/ProductsModel.dart';

class UpdateProductService {

  Future<ProductModel> updateProduct(
      {required int id,
      required String title,
      required String price,
      required String description,
       String? category,
      required String image}) async {
    print('product id :$id');
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
       'id':id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    });

    return ProductModel.fromJson(data);
  }
}
