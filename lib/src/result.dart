import 'package:flutter/material.dart';
import '../data/model.dart';
import '../data/db.dart';

class Result extends StatefulWidget {
  Result({Key? key,required this.sex,required this.res,required this.color,required this.bmi} ) : super(key: key);
  final String res ;
  final int sex ;
  final Color color ;
  final double bmi ;
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*0.07,
          right: MediaQuery.of(context).size.width*0.07,
        ),
        child:Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.07,),
            Row(
              children:[
                Text(
                  'Your',
                  style: TextStyle(
                    color: Colors.indigoAccent.shade200,
                    fontSize: 31,
                    fontWeight: FontWeight.bold,       
                  ),
                ),
                const SizedBox(width: 11,),
                const Text(
                  'Summary',
                  style: TextStyle(
                    fontFamily: 'LeagueGothic',
                    fontSize: 31
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Container(
              padding:const EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width*0.86,
              height: MediaQuery.of(context).size.height*0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
                boxShadow:const [
                  BoxShadow(
                    offset: Offset(1, 7),
                    spreadRadius: 3,
                    blurRadius: 7,
                    color: Color.fromARGB(255, 233, 233, 233)
                  )
                ]
              ),
              child: Column(
                children: [
                  Image.asset(
                    widget.sex==1?'boy.jpg':'resff.jpg',
                    fit: BoxFit.cover,width: 200,height: 200,),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Your BMI is  ',
                        style: TextStyle(
                          fontFamily: 'LeagueGothic',
                          fontSize: 30,
                          
                        ),
                      ),
                      Text(
                        '${widget.bmi.toStringAsFixed(2)}',
                        style:const TextStyle(
                          fontFamily: 'LeagueGothic',
                        color: Colors.deepPurpleAccent,
                        fontSize: 30
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Your weight is  ',
                        style:TextStyle(
                          fontFamily: 'LeagueGothic',
                      
                        fontSize: 30
                        ),
                      ),
                      Text(
                        '${widget.res}',
                        style:const TextStyle(
                          fontFamily: 'LeagueGothic',
                          color: Colors.green,
                          fontSize: 30
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
            const Center(
              child: Text(
                'Healthy BMI range: 18.5 kg/m2 - 25 kg/m2\nKeep up the good work! For tips on maintaining a healthy weight, check out the food and diet and fitness sections.',
                style: TextStyle(
                  fontSize: 15
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color:const Color.fromARGB(255, 243, 144, 248),
                    borderRadius: BorderRadius.circular(17),
                    boxShadow:const [
                      BoxShadow(
                        offset: Offset(1, 7),
                        spreadRadius: 3,
                        blurRadius: 7,
                        color: Color.fromARGB(255, 233, 233, 233)
                      )
                    ]
                  ),
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon:const Icon(Icons.refresh,color: Colors.white,)
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow:const [
                      BoxShadow(
                        offset: Offset(1, 7),
                        spreadRadius: 3,
                        blurRadius: 7,
                        color: Color.fromARGB(255, 233, 233, 233)
                      )
                    ]
                  ),
                  child: IconButton(
                    onPressed: (){
                      List<String> genre = ['female','male'];
                      Data data = Data(id: widget.sex+1, genre: genre.elementAt(widget.sex) , bmi: widget.bmi);
                      insertData(data);
                    },
                    icon:const Icon(Icons.download_done)
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}