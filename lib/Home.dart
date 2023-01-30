import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Image.asset("assets/images/logo.png"),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Saiba qual é a melhor opcção para abastecer seu carro"),
            ),
            TextField(),
            TextField(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                child: const Text("Calcular"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}