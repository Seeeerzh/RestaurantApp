import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management_app/constants/const.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:restaurant_management_app/sidemenu2.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
     
      endDrawer: Sidemenu1(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text(Const.Maintext, style:Const.MainStyle,),),
        
        actions: [IconButton(onPressed:(){_scaffoldKey.currentState!.openEndDrawer();}, icon: Icon(Icons.assessment)),],
        
           ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: ListTile(
              title: Text('Runnig orders'),
              leading: CircleAvatar(
              backgroundColor: Colors.yellow,), 
              subtitle: Text('Orders to cook'),
              trailing:Icon(Icons.local_dining_outlined),
              )
              ),
          ),
             Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: ListTile(
              title: Text('Table status'),
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,), 
                  subtitle: Text('Number of tables which are free'),
              trailing:Icon(Icons.table_bar),
              ),
              ),
          ),
          SizedBox(height: 60),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(50, 0, 0, 10) ),
              Text(Const.Maintext2, style:Const.MainStyle2, )]
          ),
          
            

          DataTable(
              columns: [
                DataColumn(label: Text('Table No')),
                DataColumn(label: Text('Time')),
                DataColumn(label: Text('Total')),
                DataColumn(label: Text('Serving Personal')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1'),),
                  DataCell(Text('Arya')),
                  DataCell(Text('6')),
                  DataCell(Text('6')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('John')),
                  DataCell(Text('9')),
                  DataCell(Text('6')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('Tony')),
                  DataCell(Text('8')),
                  DataCell(Text('6')),
                ]),
                 ],
              ),
              
            RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text("Log Out",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
            
          ],
          
        ),
        
      );
  }
  










  }

