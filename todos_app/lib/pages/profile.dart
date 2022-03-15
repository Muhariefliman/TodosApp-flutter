// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todos_app/models/User.dart';
import 'package:todos_app/pages/login.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage(User user){
    this.user = user;
  }

  late User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687"),
            ),
            SizedBox(height: 20,),
            Text(user.name, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text(user.email, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text("Todos Count: ${user.getTodos().length}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){

                showDialog(context: context, 
                  builder: (context){
                    return AlertDialog(
                      title: Text("Logout"),
                      content: Text("Are you sure you want to logout?"),
                      actions: [
                        ElevatedButton(
                          child: Text("No"),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: Text("Yes"),
                          onPressed: (){
                            Navigator.pushAndRemoveUntil<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) => loginPage(),
                                    ),
                                    (route) => false,//if you want to disable back feature set to false
                            );
                          },
                        ),
                      ],
                    );
                  }
                );

                // Navigator.pushReplacement(context, MaterialPageRoute<void>(
                //                     builder: (BuildContext context) => loginPage(),
                //   ),
                // );
              }, 
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Logout", style: TextStyle(fontSize: 15),),
              ),
            )
          ],
        )
      ),
    );
  }
}