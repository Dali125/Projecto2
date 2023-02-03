import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecto2/colors/colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';


class ReceivedProposal extends StatefulWidget {
  const ReceivedProposal({Key? key}) : super(key: key);

  @override
  State<ReceivedProposal> createState() => _ReceivedProposalState();
}

class _ReceivedProposalState extends State<ReceivedProposal> {
  @override
  Widget build(BuildContext context) {
    var data1;
    double width = MediaQuery.of(context).size.width;
    return

        //Getting the current user,or the client
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('proposals')
                .where('client_id',
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //Getting the one who sent the proposal
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];

                      //Searching for the person in the users database
                      return StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .where('Userid', isEqualTo: data['freelance_id'])
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height: 370,
                                child: ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      var data2 = snapshot.data!.docs[index];

                                      return DelayedDisplay(
                                        delay:
                                            const Duration(milliseconds: 200),
                                        child: SizedBox(
                                            height: 350,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Picture Here"),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(data2['UserName']),
                                                        Text(
                                                            '    Job Description Here')
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  height: 200,
                                                  child: StreamBuilder(
                                                    stream: FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            'ProjectTasks')
                                                        .where('Client_id',
                                                            isEqualTo:
                                                                FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .uid)
                                                        .snapshots(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        return ListView.builder(
                                                            itemCount: snapshot
                                                                .data!
                                                                .docs
                                                                .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              var data3 =
                                                                  snapshot.data!
                                                                          .docs[
                                                                      index];

                                                              return Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height: 40,
                                                                  ),
                                                                  Container(
                                                                    height: 199,
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .stretch,
                                                                      children: [
                                                                        Text(data3['Budget']
                                                                            .toString()),
                                                                        SizedBox(
                                                                          height:
                                                                              100,
                                                                        ),
                                                                        Center(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.splashColor2, elevation: 3, minimumSize: const Size(164, 40)),
                                                                                  onPressed: () {},
                                                                                  child: const Text(
                                                                                    'Hire',
                                                                                    style: TextStyle(),
                                                                                  )),
                                                                              const SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 3, minimumSize: const Size(164, 40)),
                                                                                  onPressed: () {},
                                                                                  child: Text(
                                                                                    'Message',
                                                                                    style: TextStyle(color: AppColors.splashColor2),
                                                                                  ))
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              );
                                                            });
                                                      } else
                                                        return CircularProgressIndicator();
                                                    },
                                                  ),
                                                )
                                              ],
                                            )),
                                      );
                                    }),
                              );
                            } else {
                              return Shimmer(
                                  color: AppColors.splashColor,
                                  child: Container(
                                    height: 30,
                                    width: width,
                                  ));
                            }
                          });
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
  }
}
