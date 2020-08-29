import 'package:flutter/material.dart';

import '../constantes.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.texto, @required this.icone});

  final String texto;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icone,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          texto,
          style: kTextoStyle,
        )
      ],
    );
  }
}
