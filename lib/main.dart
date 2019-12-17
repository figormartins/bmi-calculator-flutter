import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    color: Colors.deepPurple,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String _messageInfo = "Informe seus dados";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";

    setState(() {
      _messageInfo = "Informe seus dados";
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6)
        _messageInfo = "Abaixo do peso.";
      else if (imc < 25)
        _messageInfo = "Peso ideal!";
      else if (imc < 30)
        _messageInfo = "Acima do peso.";
      else if (imc < 35)
        _messageInfo = "Obesidade grau I.";
      else if (imc < 40)
        _messageInfo = "Obesidade grau II.";
      else
        _messageInfo = "Obsidade grau III.";

      _messageInfo += " IMC = ${imc.toStringAsPrecision(4)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetFields();
            },
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
              Image.asset(
                "images/icon_user.png",
                fit: BoxFit.fitHeight,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.deepPurple,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.deepPurple)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple[200]),
                controller: weightController,
                validator: (value) {
                  if (value.isEmpty) return "Insira seu peso!";

                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.deepPurple,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.deepPurple)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple[200]),
                controller: heightController,
                validator: (value) {
                  if (value.isEmpty) return "Insira sua altura!";

                  return null;
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    color: Colors.red,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) _calculate();
                      },
                      color: Colors.deepPurple,
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  )),
              Text(
                _messageInfo,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, color: Colors.deepPurple),
              )
            ],
          ),
        ),
      ),
    );
  }
}
