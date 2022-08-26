
// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management_app/Mypages/settings%20files/userpreference.dart';
import 'package:restaurant_management_app/widgets/mainpage.dart';

import '../Settings.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
    String name1 = '';
  String address1 = '';
  String number1 = '';
  String email = '';

  @override
  void initState(){
    super.initState();
    name1 = UserSimplePreferences.getUsername1() ?? '';
    address1 = UserSimplePreferences.getAddress1() ?? '';
    number1 = UserSimplePreferences.getNumber1() ?? '';
    email = UserSimplePreferences.getEmail() ?? '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
             SizedBox(
                height: 35,
              ),
              buildName1(),
              buildAddress1(),
              buildNumber1(),
              buildemail(),
            
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Mainpage()));
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      await UserSimplePreferences.setUsername1(name1);
                      await UserSimplePreferences.setAddress1(address1);
                      await UserSimplePreferences.setEmail(email);
                      await UserSimplePreferences.setNumber1(number1);
                      Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Mainpage()));
                    },
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName1() => buildTitle(
    title: 'Name',
    child: TextFormField(
      initialValue: name1,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Your name',
      ),
      onChanged: (name1) => setState(()=>this.name1 = name1),
    ),
  );
  Widget buildAddress1() => buildTitle(
    title: 'Address',
    child: TextFormField(
      initialValue: address1,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Address info',
      ),
      onChanged: (address1) => setState(()=>this.address1 = address1),
    ),
  );
Widget buildNumber1() => buildTitle(
    title: 'Number',
    child: TextFormField(
      initialValue: number1,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Phone Number',
      ),
      onChanged: (number1) => setState(()=>this.number1 = number1),
    ),
  );
Widget buildemail() => buildTitle(
    title: 'Email',
    child: TextFormField(
      initialValue: email,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Email',
      ),
      onChanged: (email) => setState(()=>this.email = email),
    ),
  );



  Widget buildTitle({
    required String title,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );
}