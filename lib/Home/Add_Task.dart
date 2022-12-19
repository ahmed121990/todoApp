import 'package:flutter/material.dart';
import 'package:todoapp/DataBase/DataBase.dart';
import 'package:todoapp/DataBase/taska.dart';
import 'package:todoapp/utils/data_utils.dart';

import '../utils/Dailog_uitls.dart';

class AddTask extends StatefulWidget {

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
       child: Form(
         key: formKey  ,
         child: Column (
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
                Text('Add New Task',style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,),
             TextFormField(
               controller: titleController,
               decoration: const InputDecoration(
                 labelText: 'Title'
               ),
               validator: (input){
                 if (input==null || input.trim().isEmpty){
                   return 'Please Enter Valid Title';
                 }
                 if (input.length<3){
                   return 'Title should be 3 character at least' ;
                 }
                 return null ;
               },
             ),
             TextFormField(
               controller: descriptionController,
               minLines: 4,
               maxLines: 4,
               decoration: const InputDecoration(
                   labelText: 'description'
               ),
              validator: (input) {
              if (input == null || input.trim().isEmpty) {
                 return 'Please Enter Valid Description';
      }
    if (input.length<3) {
      return 'Description should be 3 character at least';
    }
              return null ;
    }
             ),
            const  SizedBox(height: 12,),
             Text('Select Date',
                 style: Theme.of(context).textTheme.headline6),
            const  SizedBox(height: 8,),
             InkWell(
               onTap: (){
                 showTaskDatePicker();
               },
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(MyDateUtils.formatTask(selectedTime)
                     ,textAlign: TextAlign.center,
                     style: Theme.of(context).textTheme.headline6?.copyWith(color: Theme.of(context).primaryColor)
                 ),
               ),
             ),
             const SizedBox(height: 12,),
             ElevatedButton(onPressed: (){
               insertTask();
             }, child: Text('Submit'))
           ],
         ),
       ),
    );
  }
  var selectedTime = DateTime.now();
  void showTaskDatePicker()async{
    var userSelectedTask = await showDatePicker(context: context,
        initialDate: selectedTime,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(userSelectedTask==null){
      return ;
    }
    setState(() {
      selectedTime = userSelectedTask ;
    });
  }
  void insertTask() async{
   if (formKey.currentState?.validate()==false){
    return ;
   }
   Tasks task = Tasks( title: titleController.text, description: descriptionController.text, dateTime: selectedTime);
   DilogUtils.showLoadingDialog(context, 'loading...',isDismissble: false);
   await DataBase.insertTask(task);
   DilogUtils.HideDailog(context);
   DilogUtils.showMessage(context, 'Intserted Successfully',positiveAction: 'Ok' ,negativeAction: 'Cancel' );
  }


}

