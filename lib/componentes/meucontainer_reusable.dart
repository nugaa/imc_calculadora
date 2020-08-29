import 'package:flutter/material.dart';

class MeuContainerReusable extends StatelessWidget {
  MeuContainerReusable({@required this.cor, this.cardChild, this.onPress});

  final Color cor;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
