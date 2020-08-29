import 'package:bmi_app/calculador_brain.dart';
import 'package:bmi_app/componentes/round_icon_button.dart';
import 'package:bmi_app/componentes/bottomcontainer_button.dart';
import 'package:bmi_app/componentes/icon_content.dart';
import 'package:bmi_app/componentes/meucontainer_reusable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constantes.dart';
import 'mostrarcalculo.dart';

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
  int altura = 180;
  int peso = 50;
  int idade = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
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
                        Text(altura.toString(), style: kTextoTamanhoGrande),
                        Text(
                          'cm',
                          style: kTextoStyle,
                        )
                      ],
                    ),
                    Slider(
                      value: altura.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (double valor) {
                        setState(() {
                          altura = valor.round();
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
                            children: <Widget>[
                              RoundIconCustom(
                                icone: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    peso > 0 ? peso-- : peso = 0;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconCustom(
                                icone: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    peso < 300 ? peso++ : peso = 300;
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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'IDADE',
                            style: kTextoStyle,
                          ),
                          Text(
                            idade.toString(),
                            style: kTextoTamanhoGrande,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconCustom(
                                icone: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    idade > 1 ? idade-- : idade = 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconCustom(
                                icone: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    idade > 1 && idade < 100
                                        ? idade++
                                        : idade++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomContainerButton(
              textoBotao: 'CALCULAR',
              onPress: () {
                CalculadoraBrain calc = CalculadoraBrain(
                  height: altura,
                  weight: peso,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MostrarCalculo(
                      resultado: calc.calcularBMI(),
                      tipo: calc.getTipoBMI(),
                      frase: calc.getFraseAviso(),
                      cor: calc.getCor(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
