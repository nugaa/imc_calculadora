import 'package:flutter/material.dart';

import '../constantes.dart';

class BottomContainerButton extends StatelessWidget {
  BottomContainerButton({@required this.textoBotao, @required this.onPress});

  final String textoBotao;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            textoBotao,
            style: kBottomContainerText,
          ),
        ),
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
    );
  }
}
