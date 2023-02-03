import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projecto2/models/login_model/login_model.dart';
import 'package:projecto2/ui/message/choosechat.dart';
import 'package:projecto2/ui/profile_page/my_profile.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import '../../colors/colors.dart';
import '../message/message.dart';
import '../myHome/my_home.dart';
import '../proposal_page/proposals.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

int _currentIndex = 0;

var tabs = <Widget>[
  MyHome(),
  Proposals(),
  const Center(
    child: Text('meee'),
  ),
  Chats(),
];
var items = <BarItem>[
   BarItem(icon: Icons.search, title: 'Jobs'),
   BarItem(icon: Icons.mail, title: 'Proposals'),
   BarItem(
      icon: Ionicons.document, title: 'Contracts'),
   BarItem(icon: Icons.mail, title: 'Message'),
];

class _MainPageState extends State<MainPage> {
  String? currentUser = FirebaseAuth.instance.currentUser?.email.toString();
  String? uid = FirebaseAuth.instance.currentUser?.uid.toString();
  @override
  Widget build(BuildContext context) {
    LogoutModel logoutModel = LogoutModel();

    return ScaffoldGradientBackground(
      extendBody: true,
        body: tabs[_currentIndex],
        gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.white70,
            ]),
        bottomNavigationBar:
            DecoratedBox(

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0, 4),
                      blurRadius: 8.0)
                ],
              ),
              child:
              SlidingClippedNavBar(
                onButtonPressed: (index){
                  setState(() {
                    _currentIndex = index;
                  });

                },
                iconSize: 30,
                barItems: items, selectedIndex: _currentIndex, activeColor: AppColors.splashColor,


              ))

              ,
            );


       





  }
}
