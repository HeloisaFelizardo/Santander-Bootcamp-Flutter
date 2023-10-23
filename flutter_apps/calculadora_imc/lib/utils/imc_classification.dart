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
