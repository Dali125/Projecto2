import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecto2/confirmer.dart';


import '../../colors/colors.dart';
import '../../models/login_model/login_model.dart';
import '../home.dart';
import '../register/register_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //Email and password
  final  email = TextEditingController();
  final  passwordController = TextEditingController();



  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    email.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    //Size of Screen
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: AppColors.logColor,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            height: height / 3.5,
            width: width,
            color: AppColors.splashColor,
          ),
          const SizedBox(
            height: 40,
          ),

          //Login Button Here
          Column(
            children: [
              Text('Sign in'),
              SafeArea(

                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        labelText: 'Email/Phone',
                        hintText: 'Enter valid mail id as abc@gmail.com'),
                    controller: email,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    labelText: 'Password',
                    hintText: 'Enter your secure password',
                  ),
                  controller: passwordController,
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  onPressed: () {
                    LoginModel loginModel = LoginModel(
                        email: email.text.trim(),
                        password: passwordController.text.trim());
                    loginModel.SignIn();

                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => Confirmer()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.splashColor,
                    elevation: 8,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?'),
                  GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
                  },
                    child: Text(
                      'Register Here',
                      style: TextStyle(color: AppColors.splashColor),
                    ),
                  )
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
