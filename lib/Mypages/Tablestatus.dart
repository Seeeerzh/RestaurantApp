import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:restaurant_management_app/constants/const.dart';
import 'package:restaurant_management_app/widgets/cartscreen.dart';
import 'package:restaurant_management_app/widgets/catalog%20screen.dart';

import 'Menu.dart';

class TableStatus extends StatefulWidget {
  static int guestnum = 0;
  
  
  TableStatus({Key? key}) : super(key: key);

  @override
  State<TableStatus> createState() => _TableStatusState();
}


class _TableStatusState extends State<TableStatus> {
   List<bool>myClicks=[true, true,true,true,true,true];
  @override
  Widget build(BuildContext context) {
   
    
    
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Status'),
      ),
      body: GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 3,
  children: <Widget>[
    InkWell(
      onTap:(){
         _showInfo(0);
          
      },
       child: Container(
      padding: const EdgeInsets.all(8),
      color:(myClicks[0] == false) ? Colors.red : Colors.lime,
        child: Icon(Icons.dining_outlined),
    ),
      ),
    
    InkWell(
      onTap:(){
       _showInfo(1);
     
      },
    child: Container(
      padding: const EdgeInsets.all(8),
      color:(myClicks[1] == false) ? Colors.red : Colors.lime,
        child: Icon(Icons.dining_outlined),
    ),),
    InkWell(
      onTap:(){
        _showInfo(2);
       
      },
    child: Container(
      padding: const EdgeInsets.all(8),
      color:(myClicks[2] == false) ? Colors.red : Colors.lime,
        child: Icon(Icons.dining_outlined),
    ),),
    InkWell(
      onTap:(){
       _showInfo(3);
       
      },
    child: Container(
      padding: const EdgeInsets.all(8),
      color:(myClicks[3] == false) ? Colors.red : Colors.lime,
        child: Icon(Icons.dining_outlined),
    ),),
    InkWell(
      onTap:(){
       _showInfo(4);
     
      },
    child: Container(
      padding: const EdgeInsets.all(8),
      color:(myClicks[4] == false) ? Colors.red : Colors.lime,
        child: Icon(Icons.dining_outlined),
    ),),
    InkWell(
      onTap:(){
        _showInfo(5);
         
      },
    child: Container(
      padding: const EdgeInsets.all(8),
      color:(myClicks[5] == false) ? Colors.red : Colors.lime,
        child: Icon(Icons.dining_outlined),
    ),),
  ],
)
      );

    
  }

  void _showInfo(int a) {
    
    showDialog(
      
      barrierDismissible: true,
      context: context,
      builder: (context) => SimpleDialog(
                elevation: 0,
                title: const Center(
                  child: Text("Number of people:"),
                ),
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                  
                  ),
                  SimpleDialogOption(
                     onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,MaterialPageRoute(
                              builder: (context) => CatalogScreen(), 

                            )

                            ).then((value){
                              if (value !=null){
                                setState(() {
                                  myClicks[a]=value;
                                });
                              }

                            }  );
                    },
                  child: Text("1"),
                  

                  ),
                  SimpleDialogOption(
                     onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,MaterialPageRoute(
                              builder: (context) => CatalogScreen(), 

                            )

                            ).then((value){
                              if (value !=null){
                                setState(() {
                                  myClicks[a]=value;
                                });
                              }

                            }  );
                    },
                  child: Text("2"),
                  ),
                  SimpleDialogOption(
                     onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,MaterialPageRoute(
                              builder: (context) => CatalogScreen(), 

                            )

                            ).then((value){
                              if (value !=null){
                                setState(() {
                                  myClicks[a]=value;
                                });
                              }

                            }  );
                    },
                  child: Text("3"),
                  ),
                  SimpleDialogOption(
                     onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,MaterialPageRoute(
                              builder: (context) => CatalogScreen(), 

                            )

                            ).then((value){
                              if (value !=null){
                                setState(() {
                                  myClicks[a]=value;
                                });
                              }

                            }  );
                    },
                  child: Text("4"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            primary: Colors.lime,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        child: const SizedBox(
                            width: 100, child: Center(child: Text("Back"))),
                      ),
                    ],
                  ),
                ],
              ),
    );
  }

  
   


}