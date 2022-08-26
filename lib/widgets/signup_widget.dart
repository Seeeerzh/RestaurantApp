import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_management_app/widgets/utils.dart';

import '../main.dart';

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpWidget({Key? key, required this.onClickedSignIn}) : super(key: key);
  
  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
   final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
  @override
  Widget build(BuildContext context) {
 return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Text('Hey There \n Welcome to sign in page', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize:32),),
            SizedBox(height: 40,),
            TextFormField(
              controller: _emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Email'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
              email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,
            ),
            SizedBox(height: 4,),
            TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) =>
              value != null && value.length<6 ? 'Enter min 6 charecters' : null,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),),
                icon: Icon(Icons.lock_open, size: 32),
                label: Text('Sign up', style: TextStyle(fontSize: 24),),
                 onPressed: signUp,
              ),
              SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  text: 'Already have an account?  ',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap  = widget.onClickedSignIn,
                      
                      text: 'Log in',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    )
                  ]
                ))
          ],
            ),
      ),
          
    );
   

  }
}   
