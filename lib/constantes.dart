import 'package:flutter/material.dart';

const kContainerActiveColor = Color(0xFF1D1E33);
const kContainerInactiveColor = Color(0xFF111328);
const kBottomContainerHeight = 60.0;
const kColorBottomContainer = Color(0xFFEB1555);
const kBottomContainerRadius = 25.0;
const kMinHeight = 110.0;
const kMaxHeight = 220.0;

const TextStyle kBottomContainerText = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w900,
);

const TextStyle kTextoStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const TextStyle kTextoTamanhoGrande = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const TextStyle kTituloTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);

TextStyle kResultadoTextStyle(Color cor) {
  return TextStyle(
    color: cor,
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );
}

const TextStyle kIMCTextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);
