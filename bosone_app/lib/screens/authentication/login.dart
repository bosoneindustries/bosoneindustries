import 'package:bosone_app/screens/profile/profile_page.dart';
import 'package:bosone_app/screens/register.dart';
import 'package:bosone_app/services/fire_auth.dart';
import 'package:bosone_app/services/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            child: Form(
              key: _loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/bosone.png',
                    width: MediaQuery.of(context).size.width / 8,
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  Text(
                    'Bosone.io',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  TextFormField(
                    controller: _emailField,
                    focusNode: _focusEmail,
                    validator: (value) => Validator.validateEmail(email: value),
                    decoration: InputDecoration(
                        hintText: 'example@email.com',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                  TextFormField(
                    controller: _passwordField,
                    focusNode: _focusPassword,
                    validator: (value) =>
                        Validator.validatePassword(password: value),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey[850],
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        if (_loginFormKey.currentState!.validate()) {
                          User? user = await FireAuth.signInUsingEmailPassword(
                              email: _emailField.text,
                              password: _passwordField.text,
                              context: context);
                          if (user != null) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProfilePage(user: user)));
                          }
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey[850],
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
