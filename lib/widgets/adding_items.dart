import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Adding extends StatelessWidget {
   Adding({Key? key}) : super(key: key);
final controllerName = TextEditingController();
final controllerImage = TextEditingController();
final controllerPrice = TextEditingController();

   Future createItem({required String name, required String image, required String price}) async {
      final docItem = FirebaseFirestore.instance.collection('products').doc();
      final json ={
        'name': name,
        'image': image,
        'price': price,
      };
      await docItem.set(json);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Add items")),
       body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: controllerName,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: controllerImage,
            decoration: InputDecoration(labelText: 'Image'),
          ),
          TextField(
            controller: controllerPrice,
            decoration: InputDecoration(labelText: 'Price'),
          ),
          SizedBox(height: 32,),
        ElevatedButton(onPressed: (){
          final name  = controllerName.text;
          final image  = controllerImage.text;
          final price  = controllerPrice.text;
          createItem(name: name, image: image, price: price, );
        }, child: Text('Add new meal'),),
        ],
        ),
        
      );
    
  }
}
