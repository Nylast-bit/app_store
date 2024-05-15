

import 'package:appmovil/Buyers/view/screens/authentication_screens/register_screen.dart';
import 'package:appmovil/Buyers/view/screens/main_screen.dart';
import 'package:flutter/material.dart';

import '../../../controller/auth_controller.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthController _authController = AuthController();
  late String email;
  late String password;
  bool _isLoading = false;

  loginUser() async{
    setState(() {
      _isLoading = true;
    });
    if(_formKey.currentState!.validate()){
      String res = await _authController
          .loginUser(email, password).whenComplete(() {
        setState((){
          _formKey.currentState!.reset();
          _isLoading = false;
        });
      });

      if(res == 'Success'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Successfully'),),);
        Future.delayed(Duration.zero, () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return MainScreen();
          },));
        },) ;
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res),),);
      }
    }
    else{
      setState(() {
        _isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Complete'),),);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.98),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Text("Login to your account",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xff000000),
                letterSpacing: 1,
                ),
              ),
              const Text("To explore world exclusives",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff000000),
                letterSpacing: 0.5,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset('assets/images/Illustration.png',
              width: 250.0,
                //height: 250.0,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter valid email';
                  } else {
                    return null;
                  }

                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: const Icon(Icons.mail),
                  labelText: "Enter your email",
                  hintText: "your@email.com",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter valid password';
                  } else {
                    return null;
                  }

                },
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {

                    },
                    child: const Icon(Icons.remove_red_eye
                    ),
                  ),
                  labelText: "Enter your password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),

            const SizedBox(height: 30, ),

              GestureDetector(
                onTap: () {

                },

                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffFFAF61),
                        Color(0xffDD5746),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: _isLoading ? CircularProgressIndicator( color: Colors.white,) :
                    Text('Login',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Need an account?',
                    style: TextStyle(
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return RegisterScreen();
                      },));
                    },
                    child: const Text('Register here',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFAF61),
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
