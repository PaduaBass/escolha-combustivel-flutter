import "package:flutter/material.dart";
void main (){
 runApp(MaterialApp(
   home: Home(),
 ));
}
class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  TextEditingController gasolinaController = TextEditingController();
  TextEditingController etanolController = TextEditingController();
  String _infoText = "Informe os Valores!";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _reset (){
    gasolinaController.text = "";
    etanolController.text = "";
    setState((){
      _infoText = "Informe os Valores";
    });
  }

  void _calcular(){
    setState((){
      double gasolina = double.parse(gasolinaController.text);
      double etanol = double.parse(gasolinaController.text);
      double calculo = (etanol / gasolina)% 2;
      if(calculo >0.7){
        _infoText = "Abasteça Com Gasolina! ($calculo)";
      }
      else if(calculo < 0.7){
        _infoText = "Abasteça Com Etanol! ($calculo)";
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gasolina ou Etanol"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton (icon: Icon(Icons.refresh), onPressed: _reset,
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
                  Icon(Icons.local_gas_station,
                  size: 120.0 ,
                    color: Colors.red),

                  TextFormField(keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Valor Da Gasolina",
                      labelStyle: TextStyle(color: Colors.red),

                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 25.0),
                    controller: gasolinaController,
                    validator: (value){
                      if(value.isEmpty){
                        return "Insira o Valor da Gasolina!";
                      }
                    },

                  ),
                  TextFormField(keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Valor Do Etanol",
                      labelStyle: TextStyle(color: Colors.red),

                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 25.0),
                    controller: etanolController,
                    validator: (value){
                      if(value.isEmpty){
                        return "Insira o Valor do Etanol!";
                      }
                    },

                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Container(
                        height: 50.0,
                          child: RaisedButton(
                            onPressed: (){
                              if(_formKey.currentState.validate()){
                                _calcular();
                              }
                            },
                            child: Text("Calcular",
                              style: TextStyle(color: Colors.white, fontSize: 25.0),
                            ),
                            color: Colors.red,
                          ),
                      ),
                  ),
                  Text (_infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 25.0),
                  )
                ],
            ),
        ),
      ),
    );
  }
}
