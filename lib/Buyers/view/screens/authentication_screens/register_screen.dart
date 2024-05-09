import 'package:appmovil/Buyers/view/screens/authentication_screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {

//Naranja 0xffFFAF61
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset('assets/icons/user.png', ),
              Text('Create a new account',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff000000),
                  letterSpacing: 1,
                ),
              ),


              Text('To explore the world exclusive',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff000000),
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 30,),

              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.email),
                  labelText: "Enter your email",
                  hintText: "youremail@example.com"
                ),
              ),
              SizedBox(height: 30,),

              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                    labelText: "Enter your name",
                    hintText: "John Doe"
                ),
              ),

              SizedBox(height: 30,),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    labelText: "Enter your password",
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffFFAF61),
                      Color(0xffDD5746),
                    ],
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
               child:Center(
                 child: Text('Register',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
               ),

              ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
                  style: TextStyle(
                    color: Color(0xff000000),
                  ),
                ),
                SizedBox(width: 10,),

                InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return LoginScreen();
                    },));
                  },
                  child: Text('Log in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFAF61),
                    ),
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}
