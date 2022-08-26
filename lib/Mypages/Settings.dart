import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_management_app/Mypages/settings%20files/about_us.dart';
import 'package:restaurant_management_app/Mypages/settings%20files/contact.dart';
import 'package:restaurant_management_app/Mypages/settings%20files/profile.dart';
import 'package:restaurant_management_app/Mypages/settings%20files/restaurant_details.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text('Settings', style: TextStyle(color: Colors.black),),
      ),
      body:Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.amber,
                  child: ListTile(
                    onTap: (){
                      //edit profile section
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsUI(),  
                            )
                            
                            );
                    },
                    title: Text(user.email!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,),),
                    leading: CircleAvatar(
                     backgroundColor: Colors.lime,),
                    trailing: Icon(Icons.edit, color: Colors.white,),
                  ),
                ),
                const SizedBox(height: 10.0,),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                         onTap: (){
                       Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RestaurantDetails(),  
                            )
                            
                            );
                    },
                    title: Text('Restaurant Details'),
                    leading: Icon(Icons.lock_outline, color: Colors.lime,),
                    trailing: Icon(Icons.keyboard_arrow_right, ),
                      ),
                     
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade100,
                      ),
                      ListTile(
                         onTap: (){
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactUs(),  
                            )
                            
                            );
                          
                    },
                    title: Text('Contact us'),
                    leading: Icon(Icons.location_on, color: Colors.lime,),
                    trailing: Icon(Icons.keyboard_arrow_right, ),
                      ),
                       Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade100,
                      ),
                      ListTile(
                         onTap: (){
                      //change language section
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutUs(),  
                            )
                            
                            );
                    },
                    title: Text('About'),
                    leading: Icon(Icons.language, color: Colors.lime,),
                    trailing: Icon(Icons.keyboard_arrow_right, ),
                      ),
                  ]
                  ),
                ),
                const SizedBox(height: 20.0),
                Text('Notification Settings', style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),),
                SwitchListTile(
                  dense: true,
                  activeColor: Colors.lime,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text("Received notififcation"),
                  onChanged:(val){}, ),

                  SwitchListTile(
                    dense: true,
                  activeColor: Colors.lime,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text("Received newsletters"),
                  onChanged:null, ),

                  SwitchListTile(
                    dense: true,
                  activeColor: Colors.lime,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text("Received offer Notification"),
                  onChanged:(val){}, ),

                  SwitchListTile(
                    dense: true,
                  activeColor: Colors.lime,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text("Received App Updates"),
                  onChanged:null, ),
              ],

            ),

          ),
         
           
        ],
      ) 
      );
  }
}