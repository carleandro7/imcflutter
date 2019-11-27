import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoEdit = TextEditingController();
  TextEditingController alturaEdit = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _inforText = "Informe seus dados!";
  void _resetEdit(){
      pesoEdit.text="";
      alturaEdit.text="";
      setState(() {
              _inforText = "Informe seus dados!";        
      });

  }

  void _calcular(){
    setState(() {
    double peso = double.parse(pesoEdit.text);
    double altura = double.parse(alturaEdit.text)/100;
    double imc = peso/(altura*altura);
    _inforText = "IMC: ${imc.toStringAsPrecision(4)}";
    });
    
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculador"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
          onPressed: _resetEdit,)
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
        crossAxisAlignment:  CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person,size: 120.0, color: Colors.green),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso (kg)",
              labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign:  TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
            controller: pesoEdit,
            validator: (value){
              if(value.isEmpty){
                return "Insira seu peso";
              }
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Altura (cm)",
              labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign:  TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
            controller: alturaEdit,
            validator: (value){
              if(value.isEmpty){
                return "Insira sua altura";
              }
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
              height: 50.0,
              child: RaisedButton(
              onPressed: (){
                if(_formKey.currentState.validate()){
                  _calcular();
                }
              },
              child: Text("Calcular"),
              color: Colors.green,
              ),
            ),
          ),
          Text(_inforText,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25.0))
        ],
      ))
      )
    );
  }
}