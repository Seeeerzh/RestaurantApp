//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_management_app/constants/const.dart';
import 'package:restaurant_management_app/widgets/mainpage.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant_management_app/widgets/utils.dart';
import 'package:restaurant_management_app/widgets/utils.dart';
import 'package:restaurant_management_app/widgets/utils.dart';
import 'Mypages/settings files/userpreference.dart';
import 'widgets/auth_page.dart';
import 'widgets/login.dart';
import 'widgets/utils.dart';
import 'widgets/utils.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSimplePreferences.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: FirebaseOptions(
      apiKey: "AIzaSyC1qX0Vcjn-q3xzMLvwMS_GMgkgU3FzELw",
      appId: "1:937964130053:android:71f8f3996f5e189cfd716c",
      messagingSenderId: "XXX",
      projectId: "fir-e0a63",
    ), );
  runApp(GetMaterialApp(home: MyApp()));
}
final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      title: 'Restaurant Management App',
      theme: ThemeData(
        primarySwatch: Const.maincolor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
       home: Mainpage1(),
    );
  }
}

class Mainpage1 extends StatelessWidget {
  const Mainpage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            return Center(child: Text('Something wrong'));
          }else if(snapshot.hasData){
            return Mainpage();
          }else{
          return AuthPage();}
        }
      ),
    );
  }
}



