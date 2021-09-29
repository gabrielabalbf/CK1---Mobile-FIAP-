import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
 
  String infoResultado = "Digite os valores";
 
  void _calcular() {
    setState(() {
      double peso = double.parse(n1Controller.text);
      double altura = double.parse(n2Controller.text);
 
      double resultado = peso / (altura * altura);
 
      if(resultado <= 18.5){
        infoResultado = 'abaixo do peso';
      }
      else if(resultado >= 18.5 && resultado <=24.9){
        infoResultado = 'peso normal';
      }
      else if(resultado >= 25 && resultado <=29.9){
        infoResultado = 'sobrepeso';
      }
      else if(resultado >= 30 && resultado <= 34.9){
        infoResultado = 'obesidade grau 1';
      }
      else if(resultado >= 35 && resultado <=39.9){
        infoResultado = 'obesidade grau 2';
      }
      else if(resultado >= 40){
        infoResultado = 'obesidade grau 3 ou mórbida';
      }
      else{
        infoResultado = 'Resultado inválido.';
      }       
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcular IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite o peso",
                  labelStyle: TextStyle(color: Colors.black)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              controller: n1Controller,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite a altura",
                  labelStyle: TextStyle(color: Colors.black)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              controller: n2Controller,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _calcular,
                  child: Text("Calcular IMC",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              infoResultado,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.purple, fontSize: 35.0),
            )
          ],
        ),
      ),
    );
  }
}