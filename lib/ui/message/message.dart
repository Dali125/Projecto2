import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecto2/ui/message/choosechat.dart';
class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return ChooseChat(friendUid: 'fxkiq3sn1dDa4V7Z2lsCGuz4STFa2', friendName: 'fendName');
  }
}
