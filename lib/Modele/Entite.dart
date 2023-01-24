import 'package:urgence_projet/Modele/Entite.dart';

class Entite{
  final int id;
  final String nom;
  final String? numero;
  final String img;

  Entite( {
    required this.id,
    required this.nom,
    required this.numero,
    required this.img,
  });

  factory Entite.fromMap(Map entiteMap){
    return Entite(
        id: entiteMap['id'],
        nom: entiteMap['nom'],
        numero: entiteMap['numero'],
        img: entiteMap['img']
    );
  }
}