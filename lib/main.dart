import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Teste',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  var _infoText = "Informe seus dados";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";

    setState(() {
      _infoText = "Informe seus dados";
      _formState = GlobalKey<FormState>();
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      double imc = weight / (height * height);
      print(imc);
      if (imc < 18.6) {
        _infoText = "Abaixo do Peso ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III ${imc.toStringAsPrecision(3)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Form(
                key: _formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 128.0,
                      color: Colors.green,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Peso (KG)",
                        labelStyle: TextStyle(color: Colors.green),
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 18),
                      controller: weightController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira seu peso!";
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Altura (CM)",
                        labelStyle: TextStyle(color: Colors.green),
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 18),
                      controller: heightController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira sua altura!";
                        }
                      },
                    ),
                    Container(
                      child: RaisedButton(
                        color: Colors.green,
                        onPressed: () {
                          if (_formState.currentState.validate()) {
                            calculate();
                          }
                        },
                        child: Text(
                          "Calcular",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      _infoText,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    )
                  ],
                ),
            )
        ));
  }
}
