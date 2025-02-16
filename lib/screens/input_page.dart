import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/botton_button.dart';
import '../components/calculate.dart';
import '../components/icons_content.dart';
import '../components/reuseContainer.dart';
import '../components/round_button';
import '../constant.dart';
import 'results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = KInactiveColor;
  Color femaleCardColor = KInactiveColor;
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReuseContainer(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? KActiveColor
                        : KInactiveColor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          child: ReuseContainer(
                            onpress: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                            colour: selectedGender == Gender.female
                                ? KActiveColor
                                : KInactiveColor,
                            cardchild: IconContent(
                              icon: FontAwesomeIcons.venus,
                              label: 'FEMALE',
                            ),
                          ))),
                ],
              ),
            ),
            Expanded(
              child: ReuseContainer(
                colour: KActiveColor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT ',
                      style: KLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: KLabelTextStyle2,
                        ),
                        Text(
                          'cm',
                          style: KLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                          activeTrackColor: Colors.white,
                          thumbColor: Color.fromARGB(255, 240, 43, 102),
                          overlayColor: Color(0x29EB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 12),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25)),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        },
                        min: 120,
                        max: 200,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReuseContainer(
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: KLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: KLabelTextStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                  heroag: 'unique_fab_2',
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundedIconButton(
                                heroag: 'unique_fab_1',
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(
                                    () {
                                      weight--;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: KActiveColor,
                    ),
                  ),
                  Expanded(
                    child: ReuseContainer(
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: KLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: KLabelTextStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                  heroag: 'unique_fab_4',
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundedIconButton(
                                heroag: 'unique_fab_3',
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(
                                    () {
                                      age--;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: KActiveColor,
                    ),
                  ),
                ],
              ),
            ),
            bottomButton(
              state: 'CALCULATER',
              ontap: () {
                CalculateBrain cal =
                    CalculateBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiresult: cal.calculate(),
                        resultText: cal.getResult(),
                        feedback: cal.getRfeedback(),
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
