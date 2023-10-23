import 'package:calculadora_imc/data/database_helper.dart';
import 'package:calculadora_imc/model/measurement.dart';
import 'package:flutter/material.dart';

class MeasurementListScreen extends StatefulWidget {
  const MeasurementListScreen({super.key});

  @override
  MeasurementListScreenState createState() => MeasurementListScreenState();
}

class MeasurementListScreenState extends State<MeasurementListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Medições'),
      ),
      body: FutureBuilder<List<Measurement>>(
        future: DatabaseHelper().getMeasurements(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            final measurements = snapshot.data;
            return ListView.builder(
              itemCount: measurements?.length ?? 0,
              itemBuilder: (context, index) {
                return const ListTile(
                    // Exibir informações de medição aqui
                    );
              },
            );
          } else {
            return const Text('Nenhuma medição encontrada.');
          }
        },
      ),
    );
  }
}
