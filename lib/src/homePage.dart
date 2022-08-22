import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'result.dart';
import 'compenets.dart';
import 'controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  //Slider to select height & weight
  SfSlider sfSlider(double min,double max,int interval,int val){
    return SfSlider(
      min: 10.0,
      max: 170.0,
      value:val==0?_value:_value1,
      interval: 20,
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      minorTicksPerInterval: 1,
      onChanged: (dynamic value){
        setState(() {
           val==0?(_value = value):(_value1 = value);
        });
      }
    );
  }

  int sex = 0;

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding:EdgeInsets.only(
          left: MediaQuery.of(context).size.width*0.07,
          right: MediaQuery.of(context).size.width*0.07,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.07,),
            Row(
              children:[
                Text(
                  'BMI',
                  style: TextStyle(
                    color: Colors.indigoAccent.shade200,
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 11,),
                const Text(
                  'Calculator',
                  style: TextStyle(
                    fontFamily: 'LeagueGothic',
                    fontSize: 31
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            const Text(
              'Body mass index (BMI) is a mesur of body fat based on height and weight that applies to adult men and women.',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 135, 151, 159)
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.07,),
            Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          sex = 0;
                        });
                      },
                      child: avatar(0,sex, context),
                    ),
                    const SizedBox(height: 17,),
                    txt('female'),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                Column(
                  children: [
                    GestureDetector(
                      onTap: (() => setState(() {
                        sex=1;
                      })),
                      child: avatar(1,(sex+1)%2, context),
                    ),
                    const SizedBox(height: 17,),
                    txt('male'),
                  ],
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            //this function is defined in compenets page
            sliderContainer(
              Row(
                children: [
                  unity('(kg)',context), //this function is defined in compenets page
                  Container(
                    width: MediaQuery.of(context).size.width*0.75,
                    child:sfSlider(10.0,170.0,20,0),
                  )
                ],
              ),
              context
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            //this function is defined in compenets page
            sliderContainer(
              Row(
                children: [
                  unity('(cm)', context), //this function is defined in compenets page
                  Container(
                    width: MediaQuery.of(context).size.width*0.75,
                    child:sfSlider(20.0,200.0,30,1),
                  )
                ],
              ),
              context
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            //this function is defined in compenets page
            calcule(
              context,
              TextButton(
                onPressed: (){
                  bmi(_value,_value1,context,sex); //this function is defined in controller page
                },
                child:const Text(
                  'Calculate your BMI',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              )
            )
          ],
        ),
      ) 
    );
  }
  double _value = 30;
  double _value1 = 50;
}