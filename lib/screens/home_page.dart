import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/ProductsModel.dart';
import 'package:store_app/services/AllProductsService.dart';
import 'package:store_app/services/all_categories_service.dart';

import '../shared_widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.grey,
          ),
          title: Text(
            'New Trend',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 22),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              color: Colors.black,
              iconSize: 45,
            ),
          ],
        ),


        body: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8,top:70),
          child: FutureBuilder<List<ProductModel>?>(
            future: AllProductsService().getAllProduct(),
           builder:(context,snapshot){
              if(snapshot.hasData){
                List<ProductModel> products =snapshot.data!;

             return GridView.builder(
               itemCount: products.length,
              clipBehavior: Clip.none,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 100),
              itemBuilder: (context, index) => CustomCard(product: products[index],),
            );} else{

                return Center(child: CircularProgressIndicator());
              }
            }
          ),
        ));
  }
}
