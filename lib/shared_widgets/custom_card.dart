import 'package:flutter/material.dart';
import 'package:store_app/models/ProductsModel.dart';

import '../screens/update_screen.dart';

class CustomCard extends StatefulWidget {

  final ProductModel product;

  CustomCard({super.key, required this.product,});

  @override

  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {


  _CustomCardState( );

  bool isFav = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
      Navigator.pushNamed(context,  UpdateScreen.id,arguments: widget.product,);
    },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: Offset(10, 10),
              )
            ]),


              child: Card(
                color: Colors.white,
                shape: BeveledRectangleBorder(),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                           widget.product.title.toString().substring(0,7),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${widget.product.price.toString()}',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                if (isFav == false) {
                                  setState(() {
                                    isFav = true;
                                  });
                                } else {
                                 setState(() {
                                   isFav = false;
                                 });
                                }
                              },
                              icon: isFav == false
                                  ? Icon(Icons.favorite_border_outlined)
                                  : Icon(Icons.favorite),
                              iconSize: 32,
                              color: Colors.red),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

          ),
          Positioned(
            right: 60,
            top: -70,
            child: Image.network(
               widget.product.image.toString(),
              height: 100,
              width: 100,

            ),
          )
        ],
      ),
    );
  }
}

