import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6E6),
      appBar: AppBar(
        title: const Text(
          'IMC App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: const Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Nome'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                          decoration: InputDecoration(hintText: 'Peso'),
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: 'Altura'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text('BOTÔES'),
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text('RESULTADO'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
