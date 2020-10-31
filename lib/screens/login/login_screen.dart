import 'package:flutter/material.dart';
import 'package:flutter_login_animation/screens/login/widgets/form_container.dart';
import 'package:flutter_login_animation/screens/login/widgets/sign_up_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.jpg'), fit: BoxFit.cover)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 70),
                      child: Image.asset(
                        'images/tickicon.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                    FormContainer(),
                    SignUpButton(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
