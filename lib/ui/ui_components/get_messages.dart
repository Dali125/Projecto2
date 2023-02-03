import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetMesssages extends StatelessWidget {
  final String idMessage;
  final String groupId;
  const GetMesssages({Key? key, required this.idMessage, required this.groupId}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    CollectionReference messages = FirebaseFirestore.instance.collection('messages').doc(groupId).collection('contenchat');
    return FutureBuilder<DocumentSnapshot>(
        future: messages.doc(idMessage).get(),



        builder: (context, snapshot){

          if(snapshot.hasData){
            print(messages);

            print(groupId);
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
            return Container(height: 100,

            child: Text('${data['content']}'),);
          }else return Center();


        });
  }
}
