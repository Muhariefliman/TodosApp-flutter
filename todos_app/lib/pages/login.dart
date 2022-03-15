// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos_app/models/User.dart';
import 'package:todos_app/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:todos_app/pages/register.dart';

class loginPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final List<User> users = [];

  void addUsers(){
    users.add(new User("ABC", "ABC", "ABC"));
    users.add(new User("ABCD", "ABCD", "ABCD"));
    users.add(new User("ABCDE", "ABCDE", "ABCDE"));
    users.add(new User("ABCED", "ABCED", "ABCED"));
  }

  @override
  Widget build(BuildContext context) {
    addUsers();
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://images.unsplash.com/photo-1519709063170-124e1d4a8e24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FractionallySizedBox(
                widthFactor: 0.75,
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 1),
                        blurRadius: 8// changes position of shadow
                      ),
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Login Page',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            
                          ),
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          onPressed: () {
                            bool isValid = true;
                            // Navigator.popAndPushNamed(context, homePage());
                             if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
                              for(User user in users){
                                // print(user.email);
                                if(_emailController.text == user.email && _passwordController.text == user.password){
                                    Navigator.pushReplacement(context, MaterialPageRoute<void>(
                                      builder: (BuildContext context) => homePage(user),
                                    ),
                                  );
                                  isValid = false;
                                }
                              }
                              if(isValid){
                                showDialog(
                                  context: context, 
                                    builder: (BuildContext context) => AlertDialog(
                                    title: Icon(Icons.error_outline_sharp),
                                    content: const Text('Invalid Email or Password'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                             }else{
                               showDialog(
                                context: context, 
                                  builder: (BuildContext context) => AlertDialog(
                                  title: Icon(Icons.error_outline_sharp),
                                  content: const Text('Email and Password Must be Filled'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                             }
                          },
                        ),
                        SizedBox(height: 15),
                        RichText(
                          text: 
                            TextSpan(
                              text: 'Dont have an account? ',
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Register Here', 
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                                  recognizer: TapGestureRecognizer()..onTap = () =>{
                                    Navigator.pushReplacement(context, MaterialPageRoute<void>(
                                        builder: (BuildContext context) => registerPage()),
                                    ),
                                  }
                                ),
                              ],
                            ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}