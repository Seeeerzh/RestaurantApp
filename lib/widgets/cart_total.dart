import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_management_app/cart_controller.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 75,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[    
                Text('Total', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                ),
                ),
                Text('\$${controller.total}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                ),
                ),
       ] ),
      ),
    );
  }
}
