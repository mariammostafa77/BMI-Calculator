import 'dart:math';

import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/shared/components/component.dart';

class BMIScreen extends StatefulWidget{
  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {

  double sliderCurrentHeight = 120.0;
  int weight = 40;
  int age = 18;
  String result='';
  String resultStatus='Normal';
  Color unSelectedMaleOrFemaleColor =Colors.blueGrey.withOpacity(0.4);
  Color selectedMaleOrFemaleColor =Colors.teal;
  bool isMaleSelected = true;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState((){
                            isMaleSelected = true;
                          });
                        },
                        child: Container(
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0,),
                            color: isMaleSelected ? selectedMaleOrFemaleColor : unSelectedMaleOrFemaleColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage('assets/images/mars.png'),
                                height: 50.0,
                                width: 50.0,
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'MALE',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0,),
                    Expanded(
                      child: GestureDetector (
                        onTap: (){
                          setState((){
                            isMaleSelected = false;
                          });
                        },
                        child: Container(
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0,),
                            color: !isMaleSelected ? selectedMaleOrFemaleColor : unSelectedMaleOrFemaleColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage('assets/images/femenine.png'),
                                height: 50.0,
                                width: 50.0,
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child:Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20.0,end: 20.0),
                  child: Container(
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0,),
                      color: Colors.blueGrey.withOpacity(0.4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text(
                          'HEIGHT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children:  [
                             Text(
                              '${sliderCurrentHeight.round()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(width: 5.0,),
                            const Text('cm',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Slider(
                            value: sliderCurrentHeight,
                            min: 80.0,
                            max: 220.0,
                            //label: sliderCurrentHeight.round().toString(),
                            onChanged: (double newValue){
                              setState((){
                                sliderCurrentHeight = newValue;
                              });
                            },
                        ),
                      ],
                    ),
                  ),
                ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color: Colors.blueGrey.withOpacity(0.4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '$weight',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                FloatingActionButton(
                                  onPressed: (){
                                    setState((){
                                      if(weight>30){
                                        weight--;
                                      }
                                    });
                                  },
                                  mini: true,
                                  heroTag: 'weight--',
                                  backgroundColor: Colors.blueGrey,
                                  child: const Icon(Icons.remove),
                                ),
                                const SizedBox(width: 10.0),
                                FloatingActionButton(
                                  onPressed: (){
                                    setState((){
                                     weight++;
                                    });
                                  },
                                  mini: true,
                                  heroTag: 'weight++',
                                  backgroundColor: Colors.blueGrey,
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0,),
                    Expanded(
                      child: Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color: Colors.blueGrey.withOpacity(0.4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Text(
                              'AGE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '$age',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                FloatingActionButton(
                                  onPressed: (){
                                    setState((){
                                      if(age>16){
                                        age--;
                                      }
                                    });
                                  },
                                  mini: true,
                                  heroTag: 'age--',
                                  backgroundColor: Colors.blueGrey,
                                  child: const Icon(Icons.remove),
                                ),
                                const SizedBox(width: 10.0),
                                FloatingActionButton(
                                  onPressed: (){
                                    setState((){
                                      age++;
                                    });
                                  },
                                  mini: true,
                                  heroTag: 'age++',
                                  backgroundColor: Colors.blueGrey,
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0,end: 20.0,bottom: 20.0),
              child: defaultButton(text: 'calculate', function: (){
                  result=(weight/pow(sliderCurrentHeight/100, 2)).toStringAsFixed(1) ;
                  if(double.parse(result) >= 25){
                    resultStatus='Overweight';
                  }else{
                    if(double.parse(result) < 18.5){
                      resultStatus='Underweight';
                    }else{
                      resultStatus='Normal';
                    }
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(result,resultStatus)));
              }),
            ),
          ],
        ),
      ),
    );
  }


}