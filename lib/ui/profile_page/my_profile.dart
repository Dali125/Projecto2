import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecto2/colors/colors.dart';
import 'package:projecto2/models/login_model/login_model.dart';
import 'package:projecto2/ui/login/login_screen.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  String usernameFromDb = FirebaseAuth.instance.currentUser!.email.toString();

  @override
  Widget build(BuildContext context) {

    String uname = usernameFromDb;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(


        slivers: [

          SliverAppBar(
            expandedHeight: 160,
            flexibleSpace: Center(child: Text('Profile',style: TextStyle(fontSize: 30),),),

            actions: [
              Text('data'),

            ],
          ),SliverToBoxAdapter(
            child: SizedBox(height: 20,),
          ),

        ],
      )

    );
  }
}
