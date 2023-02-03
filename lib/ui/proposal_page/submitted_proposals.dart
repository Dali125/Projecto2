import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SubmittedProposal extends StatefulWidget {
  const SubmittedProposal({Key? key}) : super(key: key);

  @override
  State<SubmittedProposal> createState() => _SubmittedProposalState();
}

class _SubmittedProposalState extends State<SubmittedProposal> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DelayedDisplay(
      delay: Duration(milliseconds: 200),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('proposals')
              .where('client_id',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var dat1 = snapshot.data!.docs[index];

                    return StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .where('Userid', isEqualTo: dat1['freelance_id'])
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SizedBox(
                              height: 313.3,
                              child: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    var dat2 = snapshot.data!.docs[index];

                                    return StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('ProjectTasks')
                                            .where('Client_id',
                                                isEqualTo: FirebaseAuth
                                                    .instance.currentUser!.uid)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return SizedBox(
                                              height: 313.3,
                                              child: ListView.builder(
                                                  itemCount: snapshot
                                                      .data!.docs.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var dat3 = snapshot
                                                        .data!.docs[index];

                                                    return DelayedDisplay(
                                                      delay: Duration(
                                                          milliseconds: 240),
                                                      child: Container(
                                                        width: width,
                                                        height: 313.3,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xffbbb7b7))),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Container(
                                                              width: width,
                                                              height: 83.6,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  CircleAvatar(
                                                                    child:
                                                                        Placeholder(),
                                                                  ),
                                                                  Container(
                                                                    height: 100,
                                                                    width:
                                                                        169.3,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              35.5,
                                                                          width:
                                                                              100,
                                                                        ),
                                                                        Text(dat2[
                                                                            'UserName']),
                                                                        Text(
                                                                            'data')
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 100,
                                                              width: width,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text('   K' +
                                                                      dat3['Budget']
                                                                          .toString())
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                                height: 40,
                                                                width: width,
                                                                child: Center(
                                                                    child: //The buttons
                                                                        Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              30,
                                                                              0,
                                                                              25,
                                                                              0),
                                                                      child:
                                                                          ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                            backgroundColor: Colors.deepPurple[
                                                                                200],
                                                                            elevation:
                                                                                6,
                                                                            minimumSize:
                                                                                const Size(158.4, 10)),
                                                                        onPressed:
                                                                            () {
                                                                          print(
                                                                              'pressed');
                                                                        },
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text('Accept'),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                          elevation:
                                                                              6,
                                                                          minimumSize: const Size(
                                                                              158.4,
                                                                              40)),
                                                                      onPressed:
                                                                          () {},
                                                                      child:
                                                                          Center(
                                                                        child: Text(
                                                                            'Message'),
                                                                      ),
                                                                    )
                                                                  ],
                                                                )))
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            );
                                          } else
                                            return Center();
                                        });
                                  }),
                            );
                          } else
                            return Center();
                        });
                  });
            } else
              return Center();
          }),
    );
  }
}
