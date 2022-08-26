import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant_management_app/cart_controller.dart';
import 'package:restaurant_management_app/models/products_model.dart';


class CatalogProducts extends StatelessWidget {
  const CatalogProducts({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    /*ProductManager m=ProductManager();
    final cartController = Get.put(CartController());
    return StreamBuilder<List<Product>>(
      stream: m.connectMyProduct,
      builder: (context,AsyncSnapshot<List<Product>> snapshot){
          if(snapshot.hasData&&snapshot.data!.isNotEmpty){
            return Flexible(child: ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (BuildContext context, int index ){
        return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        CircleAvatar(radius: 40, backgroundImage: NetworkImage(snapshot.data![index].imageUrl.toString(),),),
        SizedBox(width: 20),
        Expanded(child: Text(snapshot.data![index].name.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),),),
        Expanded(child: Text(snapshot.data![index].price.toString()),),
        IconButton(onPressed: (){
          cartController.addProduct(snapshot.data![index]);
        },
         icon: Icon(Icons.add_circle,),)
      ],),
    );
      }));
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }

    });*/


    return Flexible(child: ListView.builder(
      itemCount: ProductMaker.products.length,
      itemBuilder: (BuildContext context, int index ){
        return CatalogProductCard(index: index);
      }));
  }
}
Widget buildItem(Product products) => ListTile(
        leading: CircleAvatar(radius: 40, backgroundImage: NetworkImage(products.imageUrl.toString(),),),
        title: Expanded(child: Text(products.name.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),),),
        trailing: Expanded(child: Text(products.price.toString()),),
);


class CatalogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final int index;
  CatalogProductCard({Key? key, required this.index,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StreamBuilder<List<Product>>(builder: ( (context, snapshot){
            if(snapshot.hasError){
              return Text('Something went wrong! ${snapshot.error}');
            }else if (snapshot.hasData){
              final products = snapshot.data!;
              return ListView(
                children: products.map(buildItem).toList(),
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }
          })),
        
       
        IconButton(onPressed: (){
          cartController.addProduct(ProductMaker.products[index]);
        },
         icon: Icon(Icons.add_circle,),)
      ],),
    );
  }
}

