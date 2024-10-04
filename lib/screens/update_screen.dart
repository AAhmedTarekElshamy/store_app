import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../models/ProductsModel.dart';
import '../services/update_product.dart';
import '../shared_widgets/customTextField.dart';
import '../shared_widgets/custom_button.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({super.key});
  static String id = 'update';
  @override
  State<UpdateScreen> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateScreen> {
  String? title,price,description, image;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel? product =
        ModalRoute.of(context)!.settings.arguments as ProductModel?;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'update product',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'product title',
                  onChanged: (data) {
                    title = data;
                  },
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'product price',
                  onChanged: (data) {
                    price = data;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'product description',
                  onChanged: (data) {
                    description = data;
                  },
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'product image',
                  onChanged: (data) {
                    image = data;
                  },
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 70,
                ),
                CustomButton(
                  text: 'update',
                  onTab: () async{
                    isLoading = true;
                    setState(() {});
                    try {
                     await updateProduct(product!);
                      print('success');
                    }   catch (e) {
                      print(e.toString());

                    }
                    isLoading = false;
                    setState(() {

                    });


                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product)async {
   await UpdateProductService().updateProduct(
        title: title ?? product.title,
        price: price ?? product.price.toString()  ,
        description: description ?? product.description,
        category: product.category,
        image: image ?? product.image, id: product.id);
  }
}
