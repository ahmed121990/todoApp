import 'package:intl/intl.dart';

class MyDateUtils {
  static String formatTask (DateTime dateTime){
   DateFormat formatter = DateFormat('dd/MM/yyyy');
   return formatter.format(dateTime);
  }
}