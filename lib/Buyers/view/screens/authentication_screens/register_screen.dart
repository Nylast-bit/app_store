import 'package:appmovil/Buyers/controller/auth_controller.dart';
import 'package:appmovil/Buyers/view/screens/authentication_screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AuthController _authController = AuthController();
  late String userName;
  late String password;
  late String email;
  bool _isLoading = false;

  registerUser() async{
    setState(() {
      _isLoading = true;
    });
    if(_formKey.currentState!.validate()){
      String res = await _authController
          .createNewUser(email, password, userName).whenComplete(() {
            setState((){
              _formKey.currentState!.reset();
              _isLoading = false;
            });
      });

      if(res == 'Success'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account Created'),),);
        Future.delayed(Duration.zero, () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return LoginScreen();
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
//Naranja 0xffFFAF61
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/icons/user.png'),
                    radius: 115,
                    backgroundColor: Colors.grey,
                  ),
                  Text(
                    'Create a new account',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff000000),
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    'To explore the world exclusive',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff000000),
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
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
                        prefixIcon: Icon(Icons.email),
                        labelText: "Enter your email",
                        hintText: "youremail@example.com"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      userName = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        labelText: "Enter your name",
                        hintText: "John Doe"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      labelText: "Enter your password",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      registerUser();
                    },
                    child: Container(
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
                      child: Center(
                        child: _isLoading ? CircularProgressIndicator( color: Colors.white,) :
                        Text('Register',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Color(0xff000000),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ));
                        },
                        child: Text(
                          'Login Here',
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
        ),
      ),
    );
  }
}
