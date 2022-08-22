import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


//return the avatar image for mal or female
Container avatar(int avt,int sex,BuildContext context){
  List box =const [
    [BoxShadow(
      color: Color.fromARGB(255, 215, 215, 215),
      spreadRadius: 1,
      offset: Offset(4, 3.5),
      blurRadius: 7
      )
    ],
    null
  ];
  return Container(
    decoration: BoxDecoration(
      boxShadow:box[sex],
      borderRadius: BorderRadius.circular(70),
      color: Colors.white
    ),
    width: MediaQuery.of(context).size.width*0.4,
    height: 150,
    child: CircleAvatar(
      child : Image.asset('avt${avt}.png', width: 150, height: 150,),
      radius: 40,
      backgroundColor: Colors.white,
    )
  );
}

// text wedget for the title of avatar
Text txt(String sex){
  return Text(
    sex,
    style:const TextStyle(
      fontWeight: FontWeight.bold
    ),
  );
}

//this function returns a container that show the result of bmi
Container unity(String unt,BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width*0.09,
    height: MediaQuery.of(context).size.height*0.06,
    margin:const EdgeInsets.only(left: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: Colors.white,
      boxShadow:const [
        BoxShadow(
          offset: Offset(0, 0),
          spreadRadius: 0,
          blurRadius: 3,
          color: Colors.grey
        )
      ]
    ),
    child:Center(
      child:  Text(
        unt,
        ),
    ),
  );
}


//Container of height & weight sliders
Container sliderContainer(Row row, BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width*0.9,
    height: MediaQuery.of(context).size.height*0.11,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
        offset: Offset(3, 4),
        spreadRadius: 0,
        blurRadius: 7,
        color: Color.fromARGB(255, 210, 210, 210)
        )
      ]
    ),
    child:row
  );
}


//a container of buttonText to calculat the result of bmi
Container calcule(BuildContext context, TextButton button){
  return Container(
    width: MediaQuery.of(context).size.width*0.9,
    height: MediaQuery.of(context).size.height*0.08,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      color:const Color.fromARGB(255, 186, 153, 243),
      boxShadow:const [
        BoxShadow(
          offset: Offset(0, 9),
          spreadRadius: 0,
          blurRadius: 10,
          color: Color.fromARGB(255, 211, 216, 224)
        )
      ]
    ),
    child: button,
  );
}