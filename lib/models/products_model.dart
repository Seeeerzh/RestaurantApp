class Product{
  final String name;
  final String imageUrl;
  final double price;
  const Product({ required this.name, required this.price, required this.imageUrl});
  static const List<Product> products = [
    Product(name: 'Pizza', price: 150.00, imageUrl:'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg?cs=srgb&dl=pexels-brett-jordan-825661.jpg&fm=jpg'),
    Product(name: 'Calzone', price: 150.00, imageUrl:'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg?cs=srgb&dl=pexels-brett-jordan-825661.jpg&fm=jpg'),
    Product(name: 'Pasta', price: 150.00, imageUrl:'https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg?cs=srgb&dl=pexels-brett-jordan-825661.jpg&fm=jpg'),

  ];

}