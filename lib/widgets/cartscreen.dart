import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_management_app/Mypages/table%20statuses/tablestatus1.dart';
import 'package:restaurant_management_app/widgets/cart_product.dart';
import 'package:restaurant_management_app/widgets/cart_total.dart';

import '../Mypages/Tablestatus.dart';

class CartScreen extends StatelessWidget {
   static bool click = true;

   CartScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your cart"),),
      body: Column(
        children: [
          CartProducts(),
          CartTotal(),
          ElevatedButton(
                        //onPressed: () {
                         // click = !click ;
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>TableStatus(),));
                        //},
                        onPressed: () {
              click = !click;
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TableStatus(),
                  ));*/
              Navigator.of(context).pop(click);
            },
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            primary: Colors.lime,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        child: const SizedBox(
                            width: 100, child: Center(child: Text("Reserve"))),
                      ),
        ],
        
      ),
    );
  }
}