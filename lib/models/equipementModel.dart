class Equipment {
  String name;
  String quantity;
  String power;

  Equipment({required this.name, required this.quantity, required this.power});

  // Convertir un objet Equipment en Map pour le stockage dans une base de données
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'power': power,
    };
  }

  // Convertir un Map en objet Equipment
  factory Equipment.fromMap(Map<String, dynamic> map) {
    return Equipment(
      name: map['name'],
      quantity: map['quantity'],
      power: map['power'],
    );
  }
}
