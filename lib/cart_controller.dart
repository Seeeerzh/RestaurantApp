import 'package:get/get.dart';
import 'package:restaurant_management_app/models/products_model.dart';

class CartController extends GetxController{
  var _products = {}.obs;
  void addProduct(Product product){
    if(_products.containsKey(product)){
      _products[product] +=1;
    }else{
    _products[product] = 1;
    }
  Get.snackbar("Product Added", "You added the ${product.name}",
  snackPosition: SnackPosition.BOTTOM,
  duration: Duration(seconds: 1),
  );
}
void removeProduct(Product product){
  if (_products.containsKey(product) && _products[product] == 1 ){
    _products.removeWhere((key, value) => key == product);
  }else{
    _products[product] -= 1;
  }
}
get products => _products;  
get productSubtotal => _products.entries
.map((product) => product.key.price * product.value).toList();
get total =>_products.entries
.map((product) => product.key.price * product.value)
.toList().reduce((value, element) => value+element).toStringAsFixed(2);

}