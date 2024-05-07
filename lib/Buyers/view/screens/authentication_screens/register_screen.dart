import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Register your new account',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xffffffff),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
