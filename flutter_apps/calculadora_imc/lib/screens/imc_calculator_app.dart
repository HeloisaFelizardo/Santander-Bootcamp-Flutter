import 'package:calculadora_imc/screens/imc_calculator_screen.dart';
import 'package:flutter/material.dart';

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
