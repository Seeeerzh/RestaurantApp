import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:restaurant_management_app/constants/const.dart';
import 'package:restaurant_management_app/widgets/cartscreen.dart';
import 'package:restaurant_management_app/widgets/catalog%20screen.dart';

import 'Menu.dart';

class TableStatus extends StatelessWidget {
   TableStatus({Key? key}) : super(key: key);
final controllernumber = TextEditingController();


   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Choose number of tables")),
       body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: controllernumber,
            decoration: InputDecoration(labelText: 'Number of tables'),
          ),
          
          SizedBox(height: 32,),
        ElevatedButton(onPressed: (){
          
          final number  = controllernumber.text;
         final docTable = FirebaseFirestore.instance.collection('NumberofTables').doc('75lDhYONnfctvV6e1GXM');
          docTable.update({'number': number});
          
        }, child: Text('Choose the number of tables '),),
        ],
        ),
        
      );
    
  }
}
