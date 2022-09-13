import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant_management_app/cart_controller.dart';
import 'package:restaurant_management_app/models/products_model.dart';
import 'package:restaurant_management_app/widgets/get_product_name.dart';

class CatalogProducts extends StatelessWidget {
  CatalogProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  return  Flexible(
        child:  CatalogProductCard(
          cartController:  Get.put(CartController()),
        ),);

  }
}

Widget buildItem(Product products) => ListTile(
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(
          products.imageUrl.toString(),
        ),
      ),
      title: Expanded(
        child: Text(
          products.name.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      trailing: Expanded(
        child: Text(products.price.toString()),
      ),
    );

class CatalogProductCard extends StatelessWidget {
  final cartController; 
   const CatalogProductCard({
    Key? key,
   required this.cartController,
  }) : super(key: key);
  Future<List<Product>> getDocsId() async {
    List<Product> docIDs = [];
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIDs.add(
                Product(name: document["name"]?.toString(),
              imageUrl: document["image"].toString(),
              price:double.tryParse(document["price"])??0,
              
              ));
            }));
    return docIDs;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: FutureBuilder(
            future: getDocsId(),
            builder: ((context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        /*leading: CircleAvatar(
                          child: Image.network(snapshot.data![index].imageUrl.toString(),
                          ),
                        ),*/
                       
                        title:
                            Text( snapshot.data![index].name.toString()),
                            subtitle: Text( snapshot.data![index].price.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            
                            cartController.addProduct(Product(
                              name: snapshot.data![index].name!,
                              imageUrl: snapshot.data![index].imageUrl!,
                              price: snapshot.data![index].price!));
                          },
                          icon: const Icon(
                            Icons.add_circle,
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          )),

        ],
      ),
    );
  }  
  
}

