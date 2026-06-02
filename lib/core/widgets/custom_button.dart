import 'package:flutter/material.dart';

class CustomButton
extends StatelessWidget {

 final String title;

 final VoidCallback onTap;

 final bool filled;

 const CustomButton({

   super.key,

   required this.title,

   required this.onTap,

   this.filled=true,

 });

 @override
 Widget build(
 BuildContext context
 ){

   return SizedBox(

     width:
     double.infinity,

     height:50,

     child:

     ElevatedButton(

       onPressed:
       onTap,

       style:

       ElevatedButton.styleFrom(

         backgroundColor:

         filled
         ?

         Colors.grey

         :

         Colors.white,

         shape:

         RoundedRectangleBorder(

           borderRadius:
           BorderRadius.circular(
           30,
           ),

           side:
           BorderSide(
           color:Colors.black
           ),

         ),
       ),

       child:
       Text(title),
     ),
   );
 }
}