import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){

    var precoAlcool = double.tryParse(_controllerAlcool.text);
    var precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    }else{
      if( (precoAlcool / precoGasolina) >= 0.7 ){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com álcool";
        });
      }

      //_limparCampos();
      
    }
  }

  /*
  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset("assets/images/logo.png"),
            ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                "Saiba qual é a melhor opcção para abastecer seu carro",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Preço Alcool, ex: 4.59"
              ),
              style: const TextStyle(
                fontSize: 22
              ),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Preço Gasolina, ex: 5.57"
              ),
              style: const TextStyle(
                fontSize: 22
              ),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: _calcular,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15))
                ),
                child: const Text(
                  "Calcular",
                  style: TextStyle(
                  fontSize: 20
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}