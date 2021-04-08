import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),

  ));
}

class Home  extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

Widget build(BuildContext context) {


    TextEditingController pesoController = TextEditingController();
    TextEditingController alturaController = TextEditingController();

    GlobalKey<FormState> _chave = GlobalKey<FormState>();

    String _info = "Informe seus dados!";

    void _reset (){
      pesoController.text = "";
      alturaController.text = "";
      setState(() {
        _info = "Informe seus dados!";
      });

    }

    void _calcular(){

     double peso = double.parse(pesoController.text);
     double altura = double.parse(alturaController.text) / 100;

     double imc =  peso / (altura * altura);

     setState((){
       if(imc < 18.5){
         _info = "Abaixo do peso (${imc.toStringAsPrecision(3)}";
       } else if(imc >=18.5 && imc <=24.9){
         _info = "Peso normal (${imc.toStringAsPrecision(3)}";
       }


     });
  }

    return Scaffold(
    appBar: AppBar(
    title: Text("Calculadora IMC"),
      centerTitle: true,
      backgroundColor: Colors.green,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _reset,
        )
      ],
    ),

    body: Form( key: _chave,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Icon(
          Icons.person_outline, size: 120.0,color: Colors.green,

        ),

        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Peso (KG):",
            labelStyle: TextStyle(color:Colors.green),

          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25.0),
          controller: pesoController,
          validator: (value){
            if(value.isEmpty){
              return "Insira seu peso";
            }
          },

        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Altura (cm):",
            labelStyle: TextStyle(color:Colors.green),

          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25.0),
          controller: alturaController,
          validator: (value){
          if(value.isEmpty){
          return "Insira seu peso";
            }
          }
        ),

        Container(
          height: 50.0, margin: const EdgeInsets.only(top: 10),
          child: RaisedButton(
            onPressed: _calcular,
            child: Text("Calcular",
              style: TextStyle(color: Colors.white, fontSize: 25.0),),
            color: Colors.green,
          ),

        ),
        Container(
          height: 50.0, margin: const EdgeInsets.only(top: 10),
          child: Text(_info, style: TextStyle(color: Colors.green),),
        )
      ],
    ))
    );



  }



  }

