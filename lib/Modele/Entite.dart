import 'package:urgence_projet/Modele/Entite.dart';

class Entite{
  final int id;
  final String nom;
  final String? numero;

  Entite({
    required this.id,
    required this.nom,
    required this.numero,
  });

  factory Entite.fromMap(Map entiteMap){
    return Entite(
        id: entiteMap['id'],
        nom: entiteMap['nom'],
        numero: entiteMap['numero']
    );
  }
}