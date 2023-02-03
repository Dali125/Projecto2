import 'dart:async';

import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecto2/ui/login/login_fail.dart';
import 'package:projecto2/ui/main_home_page/main_home_page.dart';

class Confirmer extends StatefulWidget {
  const Confirmer({Key? key}) : super(key: key);

  @override
  State<Confirmer> createState() => _ConfirmerState();
}

class _ConfirmerState extends State<Confirmer> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(



      body: StreamBuilder<User?>(

        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasError){

            return DelayedDisplay(delay: Duration(seconds: 2),child: LoginFail());

          }
          else if(snapshot.hasData){

            return const MainPage();

          }else{

            return Center(child: CircularProgressIndicator(),);
          }

        },
      )
    );
  }
}
