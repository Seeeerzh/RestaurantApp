import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GetProductName extends StatelessWidget {
  
  final String documentID;
  GetProductName({required this.documentID});
  @override
  Widget build(BuildContext context) {
    CollectionReference products = FirebaseFirestore.instance.collection('products');
    return FutureBuilder<DocumentSnapshot>
    ( future: products.doc(documentID).get(),
      builder:  (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data = 
        snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['name']}' +'   ' + '${data['price']} dollars');
      }
      return Text('Loading');
    });
  }
}