import 'dart:ui';

import 'package:appmovil/Buyers/view/screens/authentication_screens/register_screen.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.95),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("Login to your account",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xffffffff),
                letterSpacing: 1,
                ),
              ),
              Text("To explore world exclusives",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xffFFFFFF),
                letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset('assets/images/Illustration.png',
              width: 250.0,
                //height: 250.0,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.mail),
                  labelText: "Enter your email",
                  hintText: "your@email.com",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  labelText: "Enter your email",
                  hintText: "your@email.com",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),

            SizedBox(height: 30, ),

              GestureDetector(
                onTap: () {

                },

                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffcb0026),
                        Color(0xff444444),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text('Login',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Need an account?',
                    style: TextStyle(
                      color: Color(0xffffffff),
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return RegisterScreen();
                      },));
                    },
                    child: Text('Register here',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffcb0026),
                      ),
                    ),
                  ),

                ],
              )
            ],

            ),
        ),
      )
      );
  }
}
