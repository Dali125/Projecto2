import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import 'package:page_transition/page_transition.dart';


import '../colors/colors.dart';
import '../ui/home.dart';
import '../ui/login/login_screen.dart';

class SplashScreen extends StatefulWidget {


  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;

    var isLoggedin = FirebaseAuth.instance.currentUser?.uid.toString();
    return
       AnimatedSplashScreen(

         backgroundColor:AppColors.splashColor,

        splash:Container(height: height,width: width,),
        nextScreen: const Home(),
        animationDuration: const Duration(milliseconds: 4000),
        pageTransitionType: PageTransitionType.fade,
        splashTransition: SplashTransition.fadeTransition,

      );


  }
}
