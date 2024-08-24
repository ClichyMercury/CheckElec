class Compteur {
  final String numeroCompteur;
  final String localisation;
  final String typeLocal;
  final int frequenceMoyRechargement;
  final double montantMoyRechargement;
  final String userId;
  String? compteurId;

  Compteur({
    required this.numeroCompteur,
    required this.localisation,
    required this.typeLocal,
    required this.frequenceMoyRechargement,
    required this.montantMoyRechargement,
    required this.userId,
    this.compteurId,
  });

  factory Compteur.fromJson(Map<String, dynamic> json) {
    return Compteur(
      numeroCompteur: json['numero_compteur'],
      localisation: json['localisation'],
      typeLocal: json['type_local'],
      frequenceMoyRechargement: json['frequence_moy_rechargement'],
      montantMoyRechargement: json['montant_moy_rechargement'].toDouble(),
      userId: json['user_id'],
      compteurId: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numero_compteur': numeroCompteur,
      'localisation': localisation,
      'type_local': typeLocal,
      'frequence_moy_rechargement': frequenceMoyRechargement,
      'montant_moy_rechargement': montantMoyRechargement,
      'user_id': userId,
      'id': compteurId,
    };
  }
}
