import 'package:calculadora_imc/data/database_helper.dart';
import 'package:calculadora_imc/model/measurement.dart';
import 'package:calculadora_imc/screens/imc_calculator_app.dart';
import 'package:calculadora_imc/screens/imc_calculator_screen.dart';
import 'package:calculadora_imc/screens/measurement_list_screen.dart';
import 'package:calculadora_imc/utils/imc_classification.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const IMCCalculatorApp());
}

class IMCCalculatorScreenState extends State<IMCCalculatorScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  List<Measurement> measurements = [];
  final DateFormat dateFormatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IMC Calculator'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (String choice) {
                if (choice == 'visualizar_medicoes') {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MeasurementListScreen(),
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'visualizar_medicoes',
                    child: Text('Visualizar Medições'),
                  ),
                  // Outras opções de menu, se desejar
                ];
              },
            ),
          ],
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
      ),
    );
  }

  void calculateIMC() async {
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

    // Gravar medição no SQLite
    final measurement =
        Measurement(name, DateTime.now(), weight, height, imc, classification);
    await DatabaseHelper().insertMeasurement(measurement);

    // Limpar campos
    nameController.clear();
    weightController.clear();
    heightController.clear();
  }
}
