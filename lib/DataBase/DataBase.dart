import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todoapp/DataBase/taska.dart';

class DataBase {
  static CollectionReference<Tasks> getTaskCollection (){

      var taskscllections = FirebaseFirestore.instance.collection('tasks').
      withConverter(fromFirestore: ((snapshot, options) =>
          Tasks.fromFireStore(snapshot.data()!)),
          toFirestore: (task,options)=>task.toFireStore());
      return taskscllections ;

}
  static Future<void> insertTask (Tasks task){
    var tasksCollection = getTaskCollection();
    var doc = tasksCollection.doc();
    task.id = doc.id ;
   return doc.set(task);
  }
}