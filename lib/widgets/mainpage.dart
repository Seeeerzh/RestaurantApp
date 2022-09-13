
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management_app/Mypages/Tablestatus.dart';
import 'package:restaurant_management_app/constants/const.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:restaurant_management_app/sidemenu2.dart';

import 'catalog screen.dart';

class Mainpage extends StatefulWidget {
   const Mainpage({Key? key}) : super(key: key);
   
  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  
   final Stream<QuerySnapshot> rehber =
      FirebaseFirestore.instance.collection("NumberofTables").snapshots();
  
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<bool>myClicks=[true, true,true,true,true,true, true,true,true,true];
 
  
    
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
          StreamBuilder<QuerySnapshot>(
                  stream: rehber,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                          child: const SizedBox(
                        height: 100,
                        width: 100,
                        child:
                            const CircularProgressIndicator(color: Colors.grey),
                      ));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: const SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(color: Colors.grey),
                      ));
                    }
                    final data = snapshot.requireData;
                    
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            return InkWell(
                              onTap: () {
                              
                              },
                              child: Card(
                                margin: const EdgeInsets.all(5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                color: const Color.fromARGB(255, 239, 236, 220),
                                elevation: 10,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.grey,
                                    child: const SizedBox(
                                        height: 75,
                                        width: 75,
                                        child: Center(child: Icon(Icons.person))),
                                  ),
                                  
                                  title: Text(
                                    "Numbers of Tables: ${data.docs[index]["number"].toString()}"
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),)
                                      
                                        )));}),
                                        GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                
                
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                ),
                  itemCount: int.tryParse(snapshot.data!.docs[0]["number"].toString())??0,
                 itemBuilder: (context, myIndex){
                  
                return InkWell(
      onTap:(){
         _showInfo(myIndex);
              
      },
      
       child: Container(
      padding: const EdgeInsets.all(8),
      color:(myClicks[myIndex] == false) ? Colors.red : Colors.lime,
        child: const Icon(Icons.dining_outlined),
    ),
      );
              }
              
              )
                      ],
                    );}),
          
        
            // ignore: deprecated_member_use
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







  

