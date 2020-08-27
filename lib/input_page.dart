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
                          ? kcontainerActiveColor
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
                          ? kcontainerActiveColor
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
                cor: kcontainerActiveColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MeuContainerReusable(
                      cor: kcontainerActiveColor,
                    ),
                  ),
                  Expanded(
                    child: MeuContainerReusable(
                      cor: kcontainerActiveColor,
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
