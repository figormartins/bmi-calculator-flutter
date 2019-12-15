import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                onPressed: () {},
              )
            ]),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.face, size: 150, color: Colors.deepPurple[200]),
              TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.deepPurple,
                  decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(color: Colors.deepPurple)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.deepPurple[200])),
              TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.deepPurple,
                  decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.deepPurple)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.deepPurple[200])),
              Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    color: Colors.red,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.deepPurple,
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  )),
              Text(
                "resultado",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, color: Colors.deepPurple),
              )
            ],
          ),
        ));
  }
}
