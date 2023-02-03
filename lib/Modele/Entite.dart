
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

class Localisation{
  final int iduser;
  final double longitude;
  final double latitude;
  final int id;

  Localisation({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.iduser
});

  factory Localisation.fromMap(Map localisationMap){
    return Localisation(
        id: localisationMap['id'],
        longitude: localisationMap['longitude'] ,
        latitude: localisationMap['latitude'],
        iduser: localisationMap['id']);
  }
}