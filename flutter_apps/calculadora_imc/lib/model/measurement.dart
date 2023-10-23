class Measurement {
  final String name;
  final DateTime date;
  final double weight;
  final double height;
  final double imc;
  final String classification;

  Measurement(this.name, this.date, this.weight, this.height, this.imc,
      this.classification);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date.toIso8601String(),
      'weight': weight,
      'height': height,
      'imc': imc,
      'classification': classification,
    };
  }

  factory Measurement.fromMap(Map<String, dynamic> map) {
    return Measurement(
      map['name'],
      DateTime.parse(map['date']),
      map['weight'],
      map['height'],
      map['imc'],
      map['classification'],
    );
  }

  String calculateIMC() {
    return imc.toStringAsFixed(2);
  }
}
