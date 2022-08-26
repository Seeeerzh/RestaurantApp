import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
/*
class Product{
  
  static const IMAGE = "image";
  static const NAME = "name";
  static const PRICE = "price";

   String? name;
   String? imageUrl;
   double? price;
   Product({ required this.name, required this.price, required this.imageUrl});
  static const List<Product> products = [
    Product(name: 'Joes Linder', price: 9.00, imageUrl:'https://images.pexels.com/photos/3676531/pexels-photo-3676531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Product(name: 'Mamas Brunch', price: 5.00, imageUrl:'https://images.pexels.com/photos/1147993/pexels-photo-1147993.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Product(name: 'Serzhs Salad', price: 6.00, imageUrl:'https://images.pexels.com/photos/842571/pexels-photo-842571.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),

    Product(name: 'Pizza', price: 10.00, imageUrl:'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg?cs=srgb&dl=pexels-brett-jordan-825661.jpg&fm=jpg'),
    Product(name: 'Calzone', price: 8.00, imageUrl:'https://images.pexels.com/photos/10935261/pexels-photo-10935261.jpeg?cs=srgb&dl=pexels-qamar-rehman-10935261.jpg&fm=jpg'),
    Product(name: 'Pasta', price: 8.00, imageUrl:'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?cs=srgb&dl=pexels-lisa-fotios-1279330.jpg&fm=jpg'),

    Product(name: 'Oaxacan Red Chile Enchiladas', price: 9.00, imageUrl:'https://media.istockphoto.com/photos/chicken-filled-green-enchiladas-traditional-mexican-meal-picture-id1217896132?b=1&k=20&m=1217896132&s=612x612&w=0&h=GfWI_bEjIH5-ML0MlK7Zyztcol3d2q8E8C5YEV_W_LM='),
    Product(name: 'Tacos al pastor', price: 10.00, imageUrl:'https://images.pexels.com/photos/4958773/pexels-photo-4958773.jpeg?auto=compress&cs=tinysrgb&w=400'),
    Product(name: 'Chilaquiles', price: 10.00, imageUrl:'https://images.pexels.com/photos/10305696/pexels-photo-10305696.jpeg?auto=compress&cs=tinysrgb&w=400'),
    
    Product(name: 'Vietnamese Dumplings', price: 15.00, imageUrl:'https://images.pexels.com/photos/13055484/pexels-photo-13055484.jpeg?auto=compress&cs=tinysrgb&w=400'),
    Product(name: 'Chilli Chicken', price: 10.00, imageUrl:'https://images.pexels.com/photos/6249394/pexels-photo-6249394.jpeg?auto=compress&cs=tinysrgb&w=400'),
    Product(name: 'Japanese Prawn Tempura', price: 10.00, imageUrl:'https://images.pexels.com/photos/3622477/pexels-photo-3622477.jpeg?auto=compress&cs=tinysrgb&w=400'),
  ];
 Product.fromMap(Map<String, dynamic> data){
    
    imageUrl = data[IMAGE];
    name = data[NAME];
    price = data[PRICE].toDouble();
  }
}
*/
Stream<List<Product>> readItems() => FirebaseFirestore.instance.collection('products')
.snapshots().map((snapshot) => snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());


class ProductMaker{
  static  List<Product> products = [
    Product(name: 'Joes Linder', price: 9.00, imageUrl:'https://images.pexels.com/photos/3676531/pexels-photo-3676531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Product(name: 'Mamas Brunch', price: 5.00, imageUrl:'https://images.pexels.com/photos/1147993/pexels-photo-1147993.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Product(name: 'Serzhs Salad', price: 6.00, imageUrl:'https://images.pexels.com/photos/842571/pexels-photo-842571.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),

    Product(name: 'Pizza', price: 10.00, imageUrl:'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg?cs=srgb&dl=pexels-brett-jordan-825661.jpg&fm=jpg'),
    Product(name: 'Calzone', price: 8.00, imageUrl:'https://images.pexels.com/photos/10935261/pexels-photo-10935261.jpeg?cs=srgb&dl=pexels-qamar-rehman-10935261.jpg&fm=jpg'),
    Product(name: 'Pasta', price: 8.00, imageUrl:'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?cs=srgb&dl=pexels-lisa-fotios-1279330.jpg&fm=jpg'),

    Product(name: 'Oaxacan Red Chile Enchiladas', price: 9.00, imageUrl:'https://media.istockphoto.com/photos/chicken-filled-green-enchiladas-traditional-mexican-meal-picture-id1217896132?b=1&k=20&m=1217896132&s=612x612&w=0&h=GfWI_bEjIH5-ML0MlK7Zyztcol3d2q8E8C5YEV_W_LM='),
    Product(name: 'Tacos al pastor', price: 10.00, imageUrl:'https://images.pexels.com/photos/4958773/pexels-photo-4958773.jpeg?auto=compress&cs=tinysrgb&w=400'),
    Product(name: 'Chilaquiles', price: 10.00, imageUrl:'https://images.pexels.com/photos/10305696/pexels-photo-10305696.jpeg?auto=compress&cs=tinysrgb&w=400'),
    
    Product(name: 'Vietnamese Dumplings', price: 15.00, imageUrl:'https://images.pexels.com/photos/13055484/pexels-photo-13055484.jpeg?auto=compress&cs=tinysrgb&w=400'),
    Product(name: 'Chilli Chicken', price: 10.00, imageUrl:'https://images.pexels.com/photos/6249394/pexels-photo-6249394.jpeg?auto=compress&cs=tinysrgb&w=400'),
    Product(name: 'Japanese Prawn Tempura', price: 10.00, imageUrl:'https://images.pexels.com/photos/3622477/pexels-photo-3622477.jpeg?auto=compress&cs=tinysrgb&w=400'),
  ];
}


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
