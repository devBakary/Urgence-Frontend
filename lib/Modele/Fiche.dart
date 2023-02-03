class Fiche{
  final int id;
  final String nom;
  final String prenom;
  final String allergie;
  final String groupe;

  Fiche(
      this.id, this.nom, this.prenom, this.allergie, this.groupe,
      );


  factory Fiche.fromMap(Map ficheMap){
    return Fiche(
        ficheMap['id'],
        ficheMap['nom'],
        ficheMap['prenom'],
        ficheMap['allergie'],
        ficheMap['groupe']
    );
  }

}