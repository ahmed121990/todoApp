import 'package:flutter/material.dart';

class DilogUtils {
  static void showLoadingDialog (BuildContext context, String message , {bool isDismissble = true}){
    showDialog(context: context, builder: (buildContext){
      return AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 12,),
            Text(message),
          ],
        ),
      );
    },
      barrierDismissible: false
    );
  }
  static showMessage (BuildContext context, String message,{String? positiveAction , String? negativeAction}){
    showDialog(context: context, builder: (buildContext){
      List<Widget> actions = [];
      if (positiveAction!=null){
        actions.add(TextButton(onPressed: (){}, child: Text(positiveAction)));
      }
      if(negativeAction!=null){
        actions.add(TextButton(onPressed: (){}, child: Text(negativeAction)));
      }
      return AlertDialog(
        actions: actions,
        content: Text (message),
      );
    });
  }
  static void HideDailog (BuildContext context){
    Navigator.pop(context);
  }
}