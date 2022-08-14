import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

int status = 0;
class tablestatus1 extends StatefulWidget {
  const tablestatus1({Key? key}) : super(key: key);
  
  @override
  State<tablestatus1> createState() => _tablestatus1State();
}

class _tablestatus1State extends State<tablestatus1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: const Text('Reserve your table'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25.0, top: 45.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Reserve table for your company",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Number of people: ")
                  ]
                  )
                  )
                  ]
                  )
                  )
                  );

  }
}