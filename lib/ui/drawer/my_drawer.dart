import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecto2/colors/colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Center(
                  child: Column(children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('Userid',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.docs[index];
                          return Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80,
                                ),
                                Text(data['UserName']),
                                Text(FirebaseAuth.instance.currentUser!.email
                                    .toString())
                              ],
                            ),
                          );
                        });
                  } else {
                    return Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Shimmer(
                          color:AppColors.splashColor,
                            child: Container(
                          height: 9,
                          width: 30,

                        )),
                        SizedBox(height: 8,),
                        Shimmer(
                            child: Container(
                              height: 9,
                              width: 30,
                            )),
                      ],
                    );
                  }
                }),
          ]))),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
