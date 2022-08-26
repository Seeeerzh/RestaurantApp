

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_management_app/Mypages/settings%20files/userpreference.dart';
import 'package:restaurant_management_app/widgets/mainpage.dart';

import '../Settings.dart';

class RestaurantDetails extends StatelessWidget {
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

  String name = '';
  String address = '';
  String number = '';
  String currency = '';

  @override
  void initState(){
    super.initState();
    name = UserSimplePreferences.getUsername() ?? '';
    address = UserSimplePreferences.getAddress() ?? '';
    number = UserSimplePreferences.getNumber() ?? '';
    currency = UserSimplePreferences.getCurrency() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Restaurant Details",
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
                          
                    ),
                    
                ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildName(),
              buildAddress(),
              buildNumber(),
              buildCurrency(),
            
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
                      await UserSimplePreferences.setUsername(name);
                      await UserSimplePreferences.setAddress(address);
                      await UserSimplePreferences.setCurrency(currency);
                      await UserSimplePreferences.setNumber(number);
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName() => buildTitle(
    title: 'Name',
    child: TextFormField(
      initialValue: name,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Your name',
      ),
      onChanged: (name) => setState(()=>this.name = name),
    ),
  );
  Widget buildAddress() => buildTitle(
    title: 'Address',
    child: TextFormField(
      initialValue: address,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Address info',
      ),
      onChanged: (address) => setState(()=>this.address = address),
    ),
  );
Widget buildNumber() => buildTitle(
    title: 'Number',
    child: TextFormField(
      initialValue: number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Phone Number',
      ),
      onChanged: (number) => setState(()=>this.number = number),
    ),
  );
Widget buildCurrency() => buildTitle(
    title: 'Currency',
    child: TextFormField(
      initialValue: currency,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Currency',
      ),
      onChanged: (currency) => setState(()=>this.currency = currency),
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