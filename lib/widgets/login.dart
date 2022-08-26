


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_management_app/widgets/utils.dart';

import '../main.dart';
import 'forgetpassword.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;
 const LoginWidget({Key? key, required this.onClickedSignUp}) : super(key: key); 

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async {
    
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch(e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();

  }
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60),
            Text('Hey There \n Welcome \n Please enter registration data', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize:32),),
            SizedBox(height: 40,),
          TextField(
            controller: _emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 4,),
          TextField(
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),),
              icon: Icon(Icons.lock_open, size: 32),
              label: Text('Sign In', style: TextStyle(fontSize: 24),),
               onPressed: signIn,
            ),
            SizedBox(height: 24),
            GestureDetector(
              child: Text('Forgot password?', style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.background,
                fontSize: 15,
              ),),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context) => ForgotPassword()));
              },
            ),
             SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                text: 'No account?  ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
                    
                    text: 'Sign Up',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  )
                ]
              ))
        ],
          ),
          
    );
   

  }
}