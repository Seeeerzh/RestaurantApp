import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_management_app/widgets/login.dart';

import 'signup_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override

  Widget build(BuildContext context) {
    
     void toogle() =>setState(() => isLogin = !isLogin);
    return isLogin ? LoginWidget(onClickedSignUp: toogle) : SignUpWidget(onClickedSignIn: toogle);
    
  }
}