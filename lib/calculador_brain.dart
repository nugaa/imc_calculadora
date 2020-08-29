import 'dart:math';

import 'package:bmi_app/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculadoraBrain {
  CalculadoraBrain({this.height, this.weight});

  double _result;
  final int height;
  final int weight;

  String calcularBMI() {
    _result = weight / pow(height / 100, 2);
    print('$_result');
    return _result.toStringAsFixed(1);
  }

  String getTipoBMI() {
    if (_result >= 25) {
      return 'Acima do peso';
    } else if (_result > 18.5) {
      return 'Peso normal';
    } else {
      return 'Abaixo do peso';
    }
  }

  String getFraseAviso() {
    if (_result >= 25) {
      return 'Tens o peso acima do normal.\n Tenta fazer mais exercício.';
    } else if (_result > 18.5) {
      return 'Estás dentro do peso normal.\n Continua assim!';
    } else {
      return 'Tens o peso abaixo da média.\n Tens que comer mais.';
    }
  }

  Color getCor() {
    if (_result >= 25) {
      return Colors.red;
    } else if (_result > 18.5) {
      return Colors.green;
    } else {
      return kColorBottomContainer;
    }
  }
}
