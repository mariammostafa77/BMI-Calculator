import 'package:bmi_calculator/shared/components/component.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget{
  String result;
  String resultStatus='';

  ResultScreen(
      @required this.result,
      @required this.resultStatus
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('BMI Calculator'),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:  [
            const Text(
              'Your Result',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10.0,),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.4),
                  //border: Border.all(color: Colors.deepOrange),
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: const Text('A BMI of 25.0 or more is overweight, while the healthy range is 18.5 to 24.9. '
                  'BMI applies to most adults 18-65 years.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          border: Border.all(width: 2,color: Colors.teal,),
                      ),
                      child: Center(
                        child: Text(
                          result,
                          style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                     Text('Your BMI is $resultStatus',
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0,end: 20.0,top: 20.0),
              child: defaultButton(text: 'recalculate', function: (){
                Navigator.pop(context);
              }),
            ),
          ],
        ),
      ),
    );
  }

}