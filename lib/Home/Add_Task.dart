import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
       child: Form(
         child: Column (
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
                Text('Add New Task',style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,),
             TextFormField(
               decoration: const InputDecoration(
                 labelText: 'Title'
               ),
             ),
             TextFormField(
               minLines: 4,
               maxLines: 4,
               decoration: const InputDecoration(
                   labelText: 'description'
               ),
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
                 child: Text(
                     '13/12/2022',textAlign: TextAlign.center,
                     style: Theme.of(context).textTheme.headline6?.copyWith(color: Theme.of(context).primaryColor)
                 ),
               ),
             ),
             const SizedBox(height: 12,),
             ElevatedButton(onPressed: (){}, child: Text('Submit'))
           ],
         ),
       ),
    );
  }

  void showTaskDatePicker(){
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  }
}
