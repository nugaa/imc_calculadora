import 'package:flutter/material.dart';

import 'constantes.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbColor: kColorBottomContainer,
          overlayColor: Color(0x29EB1555),
          activeTrackColor: kColorBottomContainer,
          inactiveTrackColor: Color(0xFF8D8E98),
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 15.0,
          ),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
        ),
      ),
      home: InputPage(),
    );
  }
}
