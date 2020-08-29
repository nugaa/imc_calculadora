import 'package:bmi_app/constantes.dart';
import 'file:///F:/DartApps/quirkpath/bmi_app/lib/componentes/bottomcontainer_button.dart';
import 'file:///F:/DartApps/quirkpath/bmi_app/lib/componentes/meucontainer_reusable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MostrarCalculo extends StatelessWidget {
  MostrarCalculo(
      {@required this.tipo,
      @required this.resultado,
      @required this.frase,
      @required this.cor});

  String tipo;
  String resultado;
  String frase;
  Color cor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'O TEU RESULTADO',
                style: kTituloTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: MeuContainerReusable(
              cor: kContainerActiveColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    tipo,
                    style: kResultadoTextStyle(cor),
                  ),
                  Text(
                    resultado,
                    style: kIMCTextStyle,
                  ),
                  Text(
                    frase,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomContainerButton(
            textoBotao: 'RE-CALCULAR',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
