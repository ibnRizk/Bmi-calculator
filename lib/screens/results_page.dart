import 'package:bmi_calculater/constant.dart';
import 'package:flutter/material.dart';

import '../components/botton_button.dart';
import '../components/reuseContainer.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.bmiresult,
      required this.resultText,
      required this.feedback});
  final String bmiresult;
  final String resultText;
  final String feedback;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATER'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: KLabelTextStyle2,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseContainer(
              colour: Color(0xFF1D1E33),
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: Ktext,
                  ),
                  Text(
                    bmiresult,
                    style: KBMItext,
                  ),
                  Text(
                    feedback,
                    style: KBmiExplaintext,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          bottomButton(
            state: 'RE_CALCULATER',
            ontap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
