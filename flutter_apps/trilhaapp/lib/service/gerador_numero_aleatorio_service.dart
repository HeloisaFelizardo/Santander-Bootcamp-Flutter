import 'dart:math';

class GeradorNumeroAleatorioService {
  static gerarNumeroAleatorio(int numeroMaximo) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(numeroMaximo);
  }
}
