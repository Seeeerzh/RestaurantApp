import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_management_app/widgets/utils.dart';

import '../main.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
   final _emailController = TextEditingController();
   Future resetPassword() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
        
      );
      Utils.showSnackBar('Password Reset email was sent');
    } on FirebaseAuthException catch(e) {
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }

  }
   @override
  void dispose(){
    _emailController.dispose();
  
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('Reset Password'),
     ),
     body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Text('Forget something\n Maybe password? ;)', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize:24),),
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
          
            
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),),
                icon: Icon(Icons.lock_open, size: 32),
                label: Text('Reset Password', style: TextStyle(fontSize: 24),),
                 onPressed: resetPassword ,
              ),
             
          ],
            ),
      ),
     )    
    );
   

  }
}   