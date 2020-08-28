import 'package:bmi_app/ui/icon_content.dart';
import 'package:bmi_app/ui/meucontainer_reusable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constantes.dart';

bool colorCheck;

enum GenderEnum {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderEnum selectedGender;
  int height = 180;
  int peso = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MeuContainerReusable(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderEnum.male;
                        });
                      },
                      cor: selectedGender == GenderEnum.male
                          ? kContainerActiveColor
                          : kContainerInactiveColor,
                      cardChild: IconContent(
                        texto: 'MASCULINO',
                        icone: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MeuContainerReusable(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderEnum.female;
                        });
                      },
                      cor: selectedGender == GenderEnum.female
                          ? kContainerActiveColor
                          : kContainerInactiveColor,
                      cardChild: IconContent(
                          texto: 'FEMININO', icone: FontAwesomeIcons.venus),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MeuContainerReusable(
                cor: kContainerActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ALTURA',
                      style: kTextoStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kTextoTamanhoGrande),
                        Text(
                          'cm',
                          style: kTextoStyle,
                        )
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (double valor) {
                        setState(() {
                          height = valor.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MeuContainerReusable(
                      cor: kContainerActiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'PESO',
                            style: kTextoStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                peso.toString(),
                                style: kTextoTamanhoGrande,
                              ),
                              Text(
                                'Kg',
                                style: kTextoStyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //TODO: widget Criado
                            children: <Widget>[
                              RoundIconCustom(
                                icone: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    peso < 300 ? peso = peso++ : peso = 300;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconCustom(
                                icone: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    peso > 0 ? peso = peso-- : peso = 0;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MeuContainerReusable(
                      cor: kContainerActiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              decoration: BoxDecoration(
                color: kColorBottomContainer,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kBottomContainerRadius),
                  topRight: Radius.circular(kBottomContainerRadius),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundIconCustom extends StatelessWidget {
  RoundIconCustom({@required this.icone, @required this.onPress});

  final IconData icone;
  Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPress();
      },
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icone),
    );
  }
}
