import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  double? _imc;
  String? _classification;

  void _calculateIMC() {
    double? weight = double.tryParse(_weightController.text);
    double? height = double.tryParse(_heightController.text);

    if (weight != null && height != null && height > 0) {
      double imc = weight / (height * height);
      setState(() {
        _imc = imc;
        _classification = _getIMCClassification(imc);
      });
    } else {
      setState(() {
        _imc = null;
        _classification = null;
      });
    }
  }

  String _getIMCClassification(double imc) {
    if (imc < 16) {
      return "Magreza grave";
    } else if (imc >= 16 && imc < 17) {
      return "Magreza moderada";
    } else if (imc >= 17 && imc < 18.5) {
      return "Magreza leve";
    } else if (imc >= 18.5 && imc < 25) {
      return "Saudável";
    } else if (imc >= 25 && imc < 30) {
      return "Sobrepeso";
    } else if (imc >= 30 && imc < 35) {
      return "Obesidade Grau I";
    } else if (imc >= 35 && imc < 40) {
      return "Obesidade Grau II (severa)";
    } else {
      return "Obesidade Grau III (mórbida)";
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (m)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calculateIMC,
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 10),
            if (_imc != null) ...[
              Text(
                "Seu IMC: ${_imc!.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Classificação: $_classification",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:
                      _classification == "Saudável" ? Colors.green : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
            ],
            const Divider(),
            const Text(
              "Tabela de Classificação do IMC:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildIMCTableRow("Abaixo de 16.0", "Magreza grave"),
                  _buildIMCTableRow("16.0 - 17.0", "Magreza moderada"),
                  _buildIMCTableRow("17.0 - 18,5", "Magreza leve"),
                  _buildIMCTableRow("18.5 - 25.0", "Saudável"),
                  _buildIMCTableRow("25.0 - 30.0", "Sobrepeso"),
                  _buildIMCTableRow("30.0 - 35.0", "Obesidade Grau I"),
                  _buildIMCTableRow(
                      "35.0 - 40.0", "Obesidade Grau II (severa)"),
                  _buildIMCTableRow(
                      "Acima de 40", "Obesidade Grau III (mórbida)"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIMCTableRow(String range, String classification) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            range,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            classification,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
