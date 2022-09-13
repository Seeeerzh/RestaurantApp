import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<Product>> readItems() => FirebaseFirestore.instance.collection('products')
.snapshots().map((snapshot) => snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());



class Product {
    Product({
        this.name="",
        this.imageUrl="",
        this.price=0,
    });

    String? name;
    String? imageUrl;
    double? price;

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"] ??"",
        imageUrl: json["imageUrl"] ??"",
        price: json["price"] == null ? 0 : json["price"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "name": name== null ? "" : name,
        "imageUrl": imageUrl == null ? "" : imageUrl,
        "price": price == null ? 0 : price,
    };
    
}
