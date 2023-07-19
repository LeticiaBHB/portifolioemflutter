import 'package:flutter/material.dart';

class FifthRoute extends StatefulWidget {
  @override
  _FifthRouteState createState() => _FifthRouteState();
}

class _FifthRouteState extends State<FifthRoute> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height);
    if (imc < 18.0) {
      setState(() {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      });
    } else if (imc >= 18.6 && imc < 24.9) {
      setState(() {
        _infoText = "Peso Ideal(${imc.toStringAsPrecision(4)})";
      });
    } else if (imc >= 24.9 && imc < 29.9) {
      setState(() {
        _infoText = "Levemente Acima do Peso(${imc.toStringAsPrecision(4)})";
      });
    } else if (imc >= 29.9 && imc < 34.9) {
      setState(() {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      });
    } else if (imc >= 34.9 && imc < 39.9) {
      setState(() {
        _infoText = "Obesidade Grau II(${imc.toStringAsPrecision(4)})";
      });
    } else if (imc >= 40) {
      setState(() {
        _infoText = "Obesidade Grau III(${imc.toStringAsPrecision(4)})";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
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
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_search_rounded,
                size: 120.0,
                color: Colors.lightGreenAccent,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: weightController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira seu Peso";
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura(cm)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: heightController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira sua Altura";
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calculate();
                      }
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
