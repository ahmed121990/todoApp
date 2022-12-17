import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical:8 ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(18)
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: .3,
          motion: DrawerMotion(),
          children: [
           SlidableAction(onPressed: (buildContext){},
           backgroundColor: Colors.red,
             label: 'Delete',
             icon: Icons.delete,
             borderRadius:const BorderRadius.only(
               bottomLeft: Radius.circular(18),
               topLeft: Radius.circular(18),
             ),
           ),

          ],
        ),
        child: Container(

          padding: const EdgeInsets.all(8),

           decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
           color: Colors.white),
          child: Row (
            children: [
              Container(
                height: 80,
                width: 10,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),
                    color: Theme.of(context).primaryColor),

              ),
             const SizedBox(width: 8,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('this is title',style: Theme.of(context).textTheme.headline5?.
                    copyWith(color: Theme.of(context).primaryColor),),
                    const SizedBox(height: 12),
                    Text('this is description '),
                  ],
                ),
              ),
              const SizedBox(width: 8,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).primaryColor),
                child: const Icon(Icons.check,color:Colors.white ,
                size: 30,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
