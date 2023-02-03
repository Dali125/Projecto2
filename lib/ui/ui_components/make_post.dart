
import 'package:cloud_firestore/cloud_firestore.dart';

class MakePost{

int budget;
String Description;
String Duration;
String title;
String Client_id;
String HoursNeeded;


 MakePost({required this.budget, required this.Duration, required this.title, required this.Client_id, required this.Description, required this.HoursNeeded});



 Future UploadPost() async{


   try{

     await FirebaseFirestore.instance.collection('ProjectTasks').add({

       'Budget': budget,
       'Client_id': Client_id,
       'title':title,
       'Description':Description,
       'Duration' : Duration,
       'HoursNeeded': HoursNeeded



     });

   }catch (e){


   }
 }

}