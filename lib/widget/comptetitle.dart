import 'package:flutter/material.dart';

Widget headtable({required String title, required BuildContext context,required Color color}) {
  var sizew = MediaQuery.of(context).size.width;
  return Container(
    child: Center(
      child: Text(
        title,
        style: TextStyle(
            color: color,
            fontSize: 17,
            fontWeight: FontWeight.bold),
      ),
    ),
    width: sizew >= 800 ? 170 : 115,
    height: 40,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500, spreadRadius: 0.5, blurRadius: 5)
        ],
        color: Color.fromRGBO(249, 249, 249, 1),
        borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(10), top: Radius.circular(10))),

  );
}


Widget LigneWidget({required BuildContext context,required String mat,required String nom,required String cin,required String tel,required Color color,required bool b,required Function ontap}) {
  return Column(
    children: [
      SizedBox(height: 10,),
              Container(
                width: 800,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    headtable(title: mat, context: context,color: color),
                    headtable(title: nom,context: context,color: color),
                    headtable(title: cin,context: context,color: color),
                    headtable(title: tel,context: context,color: color),

                    IconButton(onPressed: (){b?ontap():null;}, icon: Icon(Icons.delete,color: b?Colors.red:Colors.transparent,)),
                    
                  ],
                ),
                
              )
    ],
  );

}