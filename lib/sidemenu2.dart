import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_management_app/Mypages/Menu.dart';
import 'package:restaurant_management_app/Mypages/Tablestatus.dart';

import 'Mypages/Settings.dart';

class Sidemenu1 extends StatelessWidget {
  const Sidemenu1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(child: Column(
            children: [Card( child:ListTile(
                      leading: Icon(
                        Icons.build,
                        color: Colors.black,
                      ),
                      title: Text(
                        "Settings",
                        style: TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Settings(),  
                            )
                            
                            );
                      },
                    ),),
                    Card( child:ListTile(
                      leading: Icon(
                        Icons.list,
                        color: Colors.black,
                      ),
                      title: Text(
                        "Menu",
                        style: TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Menu(),  
                            )
                            
                            );
                      },
                    ),),
                    Card( child:ListTile(
                      leading: Icon(
                        Icons.table_bar,
                        color: Colors.black,
                      ),
                      title: Text(
                        "Table Status",
                        style: TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TableStatus(),  
                            )
                            
                            );
                      },
                    ),),
                    
                    ],

        )),

    );
    
  }
}