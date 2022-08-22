import 'package:flutter/material.dart';
import 'result.dart';


  // this function calculate the average bmi & directs the page to the result page
  void bmi(double kg,double cm, BuildContext context, int sex) {
    double len = cm*(0.01);
    double bm = (kg)/(len*len);
    String res ='';
    Color color;
    if(bm<18.5) {
        res = 'Underweight';
        color = Colors.blue;
    }
    else if((bm>=18.5) && (bm<25)) {
        res = 'Normal weight';
        color = Colors.green;
    }
    else if((bm>=25) && (bm<30)) {
        res = 'Overweight';
        color = Colors.yellow;
    }
    else if((bm>=30) && (bm<40)) {
        res = 'Obseity';
        color = Colors.orange;
    }
    else{
        res =  'Extreme Obseity';
        color = Colors.red;
    }
      //navigate to result page
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Result(sex: sex,res:res,color: color,bmi: bm,)),
    );
  }