import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'cartscreen.dart';
import 'catalogproducts.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu to order"),
       leading: IconButton(icon: Icon(Icons.arrow_back),
       onPressed: (){
        Navigator.of(context).pop(true);
       },
       
       ),),
      body: SafeArea(child: Column(
        
        children: [
          CatalogProducts(),
          ElevatedButton( 
          onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()))
                    .then((value) {
                  if (value != null) {
                    Navigator.of(context).pop(value);
                  }
                });
              },
          child: Text('Go to Order list'))
        ],

      )),
    );
  }
}