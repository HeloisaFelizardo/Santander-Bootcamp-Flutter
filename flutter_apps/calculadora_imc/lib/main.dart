import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const IMCCalculatorApp());
}

class IMCCalculatorApp extends StatelessWidget {
  const IMCCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC Calculator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const IMCCalculatorScreen(),
    );
  }
}

class IMCCalculatorScreen extends StatefulWidget {
  const IMCCalculatorScreen({super.key});

  @override
  _IMCCalculatorScreenState createState() => _IMCCalculatorScreenState();
}

class _IMCCalculatorScreenState extends State<IMCCalculatorScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  List<Measurement> measurements = [];
  final DateFormat dateFormatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              controller: weightController,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: heightController,
              decoration: const InputDecoration(labelText: 'Altura (m)'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: calculateIMC,
              child: const Text('Calcular IMC'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: measurements.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Nome: ${measurements[index].name}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Peso: ${measurements[index].weight} kg'),
                        Text('Altura: ${measurements[index].height} m'),
                        Text('IMC: ${measurements[index].calculateIMC()}'),
                        Text(
                            'Classificação: ${measurements[index].classification}'),
                        Text(
                            'Data da medição: ${dateFormatter.format(measurements[index].date)}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateIMC() {
    String name = nameController.text;
    double weight =
        double.tryParse(weightController.text.replaceAll(',', '.')) ?? 0.0;
    double height =
        double.tryParse(heightController.text.replaceAll(',', '.')) ?? 0.0;

    if (name.isEmpty || weight <= 0 || height <= 0) {
      return;
    }

    double imc = weight / (height * height);
    String classification = getIMCClassification(imc);

    setState(() {
      measurements.add(Measurement(
          name, DateTime.now(), weight, height, imc, classification));
      nameController.clear();
      weightController.clear();
      heightController.clear();
    });
  }

  String getIMCClassification(double imc) {
    if (imc < 18.5) {
      return "Abaixo do peso";
    } else if (imc < 24.9) {
      return "Peso normal";
    } else if (imc < 29.9) {
      return "Sobrepeso";
    } else if (imc < 34.9) {
      return "Obesidade Grau 1";
    } else if (imc < 39.9) {
      return "Obesidade Grau 2";
    } else {
      return "Obesidade Grau 3";
    }
  }
}

class Measurement {
  final String name;
  final DateTime date;
  final double weight;
  final double height;
  final double imc;
  final String classification;

  Measurement(this.name, this.date, this.weight, this.height, this.imc,
      this.classification);

  String calculateIMC() {
    return imc.toStringAsFixed(2);
  }
}
