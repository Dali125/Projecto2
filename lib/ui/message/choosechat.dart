import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../drawer/my_drawer.dart';
import 'message_box.dart';

class ChooseChat extends StatefulWidget {
  final String friendUid;
  final String friendName;
  const ChooseChat(
      {Key? key, required this.friendUid, required this.friendName})
      : super(key: key);

  @override
  State<ChooseChat> createState() => _ChooseChatState(friendUid, friendName);
}

class _ChooseChatState extends State<ChooseChat> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  final friendUid;
  final friendName;
  final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  var _textController = new TextEditingController();
  var chatDocId;

  _ChooseChatState(this.friendUid, this.friendName);

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    await messages
        .where('users', isEqualTo: {friendUid: null, currentUserId: null})
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) async {
            if (querySnapshot.docs.isNotEmpty) {
              setState(() {
                chatDocId = querySnapshot.docs.single.id;
              });

              print(chatDocId);
            } else {
              await messages.add({
                'users': {currentUserId: null, friendUid: null},
                'names': {
                  currentUserId: FirebaseAuth.instance.currentUser?.displayName,
                  friendUid: friendName
                }
              }).then((value) => {chatDocId = value});
            }
          },
        )
        .catchError((error) {});
  }

  void sendMessage(String msg) {
    if (msg == '') return;
    messages.doc(chatDocId).collection('chats').add({
      'createdOn': FieldValue.serverTimestamp(),
      'uid': currentUserId,
      'friendName': friendName,
      'msg': msg
    }).then((value) {
      _textController.text = '';
    });
  }

  bool isSender(String friend) {
    return friend == currentUserId;
  }

  Alignment getAlignment(friend) {
    if (friend == currentUserId) {
      return Alignment.topRight;
    }
    return Alignment.topLeft;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          flexibleSpace: Center(
            child: Text(
              'Messages',
              style: TextStyle(fontSize: 30),
            ),
          ),
          expandedHeight: 90,
        ),
        SliverToBoxAdapter(
       )
      ]),
      drawer: MyDrawer(),
    );
  }
}
